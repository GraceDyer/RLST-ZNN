
function jf_h = jf_hs(t,err)
sign_err = sign(err);
jf_h = cumsum(sign_err) * (t(2) - t(1));
end