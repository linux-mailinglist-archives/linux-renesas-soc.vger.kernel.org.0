Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66A26E7CE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Apr 2023 16:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjDSOhC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Apr 2023 10:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjDSOhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2023 10:37:01 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20C7CE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2023 07:36:52 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id n17so4796118ybq.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2023 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681915012; x=1684507012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yyOsfgBclPLx0AOTQZvY65cyQNRQS8FVzcRQkF9DgsE=;
        b=XgodfPaBgWp5PF+6z3ygSRBMH5BQU1NQ1twrWSxtBiXb+ip+4I3sgCx+ADGWsapttx
         SqYSVZzokTb/9l49Wy4UELftVLH2vlWgPpI6QpXfbeoi84E01k/5gXpZloBHY2Wp67+c
         BMSpheGT24V2Mc/HKuteWOV+KCgsHElmoULzOp3g8guTEvWEuNAdoNTYipKzI1Abp9e3
         Wxanc3v3oEbdiU6JOm06YM12s74Tks4pRuIEhrx6R9HN9bm8a6RWqHG134zSYGlKSQ4h
         SkuDRvMRhUqKnflJ2yORxDekAf8UJm9LkahWsHyRwMhx/vlhXE9+v0Pu2mVBSIGXX7mg
         6aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681915012; x=1684507012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyOsfgBclPLx0AOTQZvY65cyQNRQS8FVzcRQkF9DgsE=;
        b=AafYjgbmsahOADq1uF0/5vQGDZnfL7RYxYRIM7gI/F61Ugx1u+1U+chR9MqxKVDmgC
         F/C22lRSq4mVFknYKpSEnAtwPH7Q20i0mnxRuZ1KICMFHHEGb/Q9RiwgE9yvAE7wD9JG
         xA9d4g15ewm2PW174WPCjC2Iny/TlqMbqgrlcXUl2c2zmlXf8gn+3UOMKfEqehPWledL
         HcXDz1wbI6oUItFqhlUOJQ3lGuMGP0tpAQZ1ADFpXj3rwya30W6JTDgE1/AB4nQbX+ch
         wJk8KswUTwnEqbLLYIqJuhHKDGV3cpgZ1fQr/0gV11J6IewbgeV+scV1zd+GL65seHWz
         akaA==
X-Gm-Message-State: AAQBX9eoquxdH1VulC4HHsRFe+kDvtDYbWQGaHUlarovUqu0aWefqyqX
        MS9gJALJufBQX1wTlckx+ajHjA==
X-Google-Smtp-Source: AKy350aDAXrUsHV+fpPbTGseY8bsUobjjG6apQoGGU/aZVgQxA7x/qSX9F7YLZA5Xfee+boB9ZNjlQ==
X-Received: by 2002:a25:2302:0:b0:b97:1e2e:a4e5 with SMTP id j2-20020a252302000000b00b971e2ea4e5mr979307ybj.40.1681915012013;
        Wed, 19 Apr 2023 07:36:52 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id b126-20020a253484000000b00b96ae6e1f57sm342611yba.41.2023.04.19.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:36:51 -0700 (PDT)
Date:   Wed, 19 Apr 2023 10:36:49 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] counter: rz-mtu3-cnt: Unlock on error in
 rz_mtu3_count_write()
Message-ID: <ZD/8gbcin4RQYd+A@fedora>
References: <93ec19d1-3b74-4644-9f67-b88c08e79752@kili.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZpW/ZxYIlzkFmkhs"
Content-Disposition: inline
In-Reply-To: <93ec19d1-3b74-4644-9f67-b88c08e79752@kili.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ZpW/ZxYIlzkFmkhs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 05:23:55PM +0300, Dan Carpenter wrote:
> The return -ERANGE error paths need to call mutex_unlock(&priv->lock);
> before returning.
>=20
> Fixes: 25d21447d896 ("counter: Add Renesas RZ/G2L MTU3a counter driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/counter/rz-mtu3-cnt.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.c
> index a371bab68499..aeadce5e2853 100644
> --- a/drivers/counter/rz-mtu3-cnt.c
> +++ b/drivers/counter/rz-mtu3-cnt.c
> @@ -358,19 +358,23 @@ static int rz_mtu3_count_ceiling_write(struct count=
er_device *counter,
>  	switch (count->id) {
>  	case RZ_MTU3_16_BIT_MTU1_CH:
>  	case RZ_MTU3_16_BIT_MTU2_CH:
> -		if (ceiling > U16_MAX)
> -			return -ERANGE;
> +		if (ceiling > U16_MAX) {
> +			ret =3D -ERANGE;
> +			goto unlock;
> +		}
>  		priv->mtu_16bit_max[ch_id] =3D ceiling;
>  		break;
>  	case RZ_MTU3_32_BIT_CH:
> -		if (ceiling > U32_MAX)
> -			return -ERANGE;
> +		if (ceiling > U32_MAX) {
> +			ret =3D -ERANGE;
> +			goto unlock;
> +		}
>  		priv->mtu_32bit_max =3D ceiling;
>  		break;
>  	default:
>  		/* should never reach this path */
> -		mutex_unlock(&priv->lock);
> -		return -EINVAL;
> +		ret =3D -EINVAL;
> +		goto unlock;
>  	}
> =20
>  	pm_runtime_get_sync(ch->dev);
> @@ -381,9 +385,9 @@ static int rz_mtu3_count_ceiling_write(struct counter=
_device *counter,
> =20
>  	rz_mtu3_8bit_ch_write(ch, RZ_MTU3_TCR, RZ_MTU3_TCR_CCLR_TGRA);
>  	pm_runtime_put(ch->dev);
> +unlock:
>  	mutex_unlock(&priv->lock);
> -
> -	return 0;
> +	return ret;
>  }
> =20
>  static void rz_mtu3_32bit_cnt_setting(struct counter_device *counter)
> --=20
> 2.39.2
>=20

The lock is acquired by rz_mtu3_lock_if_counter_is_valid(), so that
function needs a sparse __acquires(&priv->lock) annotation too.

William Breathitt Gray

--ZpW/ZxYIlzkFmkhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZD/8gQAKCRC1SFbKvhIj
K4PrAP9S/rhqvPndnREAS7jj+Syv1v7AZIZQlVV2YF9MRlYMsAEA5bw2L2zyGPm1
htIurAWb+TWnY3iXsL4yTVbh0LiyLQ4=
=Lq3O
-----END PGP SIGNATURE-----

--ZpW/ZxYIlzkFmkhs--
