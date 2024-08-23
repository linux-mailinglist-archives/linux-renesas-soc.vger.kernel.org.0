Return-Path: <linux-renesas-soc+bounces-8188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBF295D3CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 18:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 307B3B24739
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 16:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220C6188A1A;
	Fri, 23 Aug 2024 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iag1mVuO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985818594C;
	Fri, 23 Aug 2024 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724432079; cv=none; b=YMeCGPWyVKIBnHrBmepN/dXhjWokljYHQRtD9ijCuEF9NuJcUw4Bc3GeXKHvVrlfB1qRXC4t3bjC6IvkQoliXypgWXpZGZPXq1YNJHu5u0iEPz3+V94rLGty8xFAMTv6gKUAWT8B1jSvAsWkoUm4UltwAISW0agDytARkWtD+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724432079; c=relaxed/simple;
	bh=5VhG0B8dTv3e3c3BO1l1k7Sja5Ij0EPbr7H3pKg3dZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EkN1QUJyemzS0XhFi/yUiQOyHgU4ElGDSRInk1EIDKkAyorXoB47tVvBi4U/tmdZmBhI/1AK7ALDhtlJUFkPL0BAPjMhO77DSPYLbMZu+LGZ6BvjjlAhFu43jALvJPDs0n+bjraiDExSj0/P+ClR6fmMJ9jFmzo7riw5HxPTxlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iag1mVuO; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3f07ac2dcso25226441fa.2;
        Fri, 23 Aug 2024 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724432075; x=1725036875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zon1U6XI7RDgoBlJOOvO1r9gIw8jdWpzCbK+CHqcbzY=;
        b=Iag1mVuOlAK02O89s8ItagdB7KxFb/l0VtZOm8QwRTDcwq44pmumRwJepDOZ4P7Fzh
         4iNwbkT+1Wcn49sQZ8RXBdH2uAzcFNq1fAp9YE8Fh8khq75Ql+FIMVpQNgnnHrTVU5ET
         LTGADfJqgJZYWShl6ev6eMCcv3Ul9WQakW0MJsOhayQ1iJ3CcFozVPp+tplzK3HtzluY
         ejClO0qBIPU9yy0Z13IT9uNBcLWx9kRT8ZfpXnSeQvBe8zBivgRjixMJfuLSI79NxL7q
         en+uo+dH0ga0prp4K+Y81joqv1uwsRoOT5LlYbp0VtlnkacE+PjUkDGqLa4VSA8JdK97
         1R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724432075; x=1725036875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zon1U6XI7RDgoBlJOOvO1r9gIw8jdWpzCbK+CHqcbzY=;
        b=sqkBlh/uhvV2iTukQAO00mQjon+W8ytsW6MaAe9pce8bSaAo1f1FsVt+GoMMyF122T
         eMgcCeSRZMKQcTPQEGLFEuUeTvC5NWkO+tr5+mX0gx8bKWudHi7VxuszmoDGagvMrwmj
         aFxtk87ScExLLBReMFEH3Lo6lIkrbioYEID2uereMgfweB1tL5i3KBxYQ2JhhYsQ8Vn8
         /tXV4VVLgSfFCq///E+eZ/jaYFTKwXa3F2D3WRzFdG2w3UX2J3+9uL/RMllVfeXOW7tv
         DMHYlWnfh9W4dbr0lbBx3+wteHJcVe2PzoKOGfMJTb8CElD0yZMYwpCk+vxXtVGHvlW+
         +O8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6ydRtiBvzYpU4C8SAk+3Ny4FazqYB2zlQ2/9OnOf7Qm1OF3O86yjO3IkCXHz9Y3JgpS3yIoAT@vger.kernel.org, AJvYcCX87qUH4nxV8xcbbgRkyGOwzEpSBhttpretXi47lu8IxpnxJpbgypo60sAMQIeupMYA5AJFsTjkTcxFPj0cWwIJeSU=@vger.kernel.org, AJvYcCXkZZQZZ3I33aYQPDPHW4rH4EZ16AETMhRjBPI7AEi1Sbqikc715O4G3vam62UKt6Tc9rs23ibXt+FVdKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXQ0YSyeDubJ31X62fKThoAHAuFKQcyPd15+PI5UczLX24jCOa
	j6UNEtNeS3J1xOAovfEe2gSQQ4xRMJ7aI7g8mrYJwp41COGGTQgJ8gZpKTJltftCY38iVsszB8M
	g8L7x5cM9vSYcwDdCnWjDNadh9lI=
X-Google-Smtp-Source: AGHT+IFEzl8US1Mj3j70Ag46lDtaK4hvgcjCEPbcQtWo5rRj98mh3iglrl7HOszxszM05TikzwLuQPgOV0GYu+wm+ic=
X-Received: by 2002:a2e:9d07:0:b0:2f3:f794:b18 with SMTP id
 38308e7fff4ca-2f4f57357bcmr15390471fa.11.1724432075088; Fri, 23 Aug 2024
 09:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823072122.2053401-1-frank.li@vivo.com> <20240823072122.2053401-8-frank.li@vivo.com>
In-Reply-To: <20240823072122.2053401-8-frank.li@vivo.com>
From: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Date: Fri, 23 Aug 2024 18:54:23 +0200
Message-ID: <CAHzn2R39CuQS3WJYs7=2jeg8LvhTrYC8xKmOiTDZKLhmbsLqig@mail.gmail.com>
Subject: Re: [net-next v2 7/9] net: ethernet: marvell: mvneta: Convert to devm_clk_get_enabled()
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org, 
	linux@armlinux.org.uk, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, kees@kernel.org, 
	justinstitt@google.com, u.kleine-koenig@pengutronix.de, horms@kernel.org, 
	sd@queasysnail.net, linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 23 sie 2024 o 09:07 Yangtao Li <frank.li@vivo.com> napisa=C5=82(a):
>
> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>

Thanks!
Marcin


>  drivers/net/ethernet/marvell/mvneta_bm.c | 16 +++++-----------
>  drivers/net/ethernet/marvell/mvneta_bm.h |  1 -
>  2 files changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/ethernet/marvell/mvneta_bm.c b/drivers/net/ether=
net/marvell/mvneta_bm.c
> index 3f46a0fed048..bfd1ed12d98c 100644
> --- a/drivers/net/ethernet/marvell/mvneta_bm.c
> +++ b/drivers/net/ethernet/marvell/mvneta_bm.c
> @@ -411,6 +411,7 @@ static int mvneta_bm_probe(struct platform_device *pd=
ev)
>  {
>         struct device_node *dn =3D pdev->dev.of_node;
>         struct mvneta_bm *priv;
> +       struct clk *clk;
>         int err;
>
>         priv =3D devm_kzalloc(&pdev->dev, sizeof(struct mvneta_bm), GFP_K=
ERNEL);
> @@ -421,17 +422,14 @@ static int mvneta_bm_probe(struct platform_device *=
pdev)
>         if (IS_ERR(priv->reg_base))
>                 return PTR_ERR(priv->reg_base);
>
> -       priv->clk =3D devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(priv->clk))
> -               return PTR_ERR(priv->clk);
> -       err =3D clk_prepare_enable(priv->clk);
> -       if (err < 0)
> -               return err;
> +       clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
>
>         err =3D mvneta_bm_get_sram(dn, priv);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "failed to allocate internal memory\n=
");
> -               goto err_clk;
> +               return err;
>         }
>
>         priv->pdev =3D pdev;
> @@ -452,8 +450,6 @@ static int mvneta_bm_probe(struct platform_device *pd=
ev)
>
>  err_sram:
>         mvneta_bm_put_sram(priv);
> -err_clk:
> -       clk_disable_unprepare(priv->clk);
>         return err;
>  }
>
> @@ -473,8 +469,6 @@ static void mvneta_bm_remove(struct platform_device *=
pdev)
>
>         /* Dectivate BM unit */
>         mvneta_bm_write(priv, MVNETA_BM_COMMAND_REG, MVNETA_BM_STOP_MASK)=
;
> -
> -       clk_disable_unprepare(priv->clk);
>  }
>
>  static const struct of_device_id mvneta_bm_match[] =3D {
> diff --git a/drivers/net/ethernet/marvell/mvneta_bm.h b/drivers/net/ether=
net/marvell/mvneta_bm.h
> index e47783ce77e0..396dced914aa 100644
> --- a/drivers/net/ethernet/marvell/mvneta_bm.h
> +++ b/drivers/net/ethernet/marvell/mvneta_bm.h
> @@ -94,7 +94,6 @@ enum mvneta_bm_type {
>
>  struct mvneta_bm {
>         void __iomem *reg_base;
> -       struct clk *clk;
>         struct platform_device *pdev;
>
>         struct gen_pool *bppi_pool;
> --
> 2.39.0
>

