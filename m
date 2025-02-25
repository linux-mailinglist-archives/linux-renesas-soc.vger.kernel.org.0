Return-Path: <linux-renesas-soc+bounces-13685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C27ECA44EAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 22:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB0D3A2CA2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 21:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FEF19F41B;
	Tue, 25 Feb 2025 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSetpMIY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1816318DB26;
	Tue, 25 Feb 2025 21:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518300; cv=none; b=jsu0FZ+Bd0jTdPXQQmq5K55Qr+R4EYYb9R81fYK061dYT1cxbj5j983bnl/49Xown4PM5UMP+OTREcnksYtduSd7MRDtsGRuxwvQZgSTnGLa7ExPC/Mi3qMQhUAjfvf7GLwcF2X7DBJchvEaBemV10T/FVZepAyqT7f4+GJV14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518300; c=relaxed/simple;
	bh=AmI/ROhV4lpAECeyGeJEqy6tUHFxvNeAOstOpVPldJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wc3Vo7D/CdAVFHnB069fXzDoMznTZ96QMstzbY5fcsg8hrUcM+ATMx8Yc1vdAR1CNcBxqNosnWPbHRG8AKFn0438H4hsoUYhRQ+qRVCgywH9RazQDHdS6kozkpNJ2B434OKUkNJdDkaUKd9vMNAkL8Oo18mEusNm5Y70VYAcCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSetpMIY; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-521b188df16so1444279e0c.2;
        Tue, 25 Feb 2025 13:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740518298; x=1741123098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClmqOl/Tw6JC6bZhWsysftkJJqIKxw8FKGY3Yy+YdFc=;
        b=QSetpMIYBK5OYrmUJ6eo6u4J0Pe3ps90usqNfOSs4VYXfw7/G98Eb9naOtzhANuIe3
         NePKnPhrfQ7qem6wZEI9b0p89Jf1H0eYfixwhHRjRu8SZhFwp4Ifw5zRqUHre7BD+vel
         KFL9PoWGACkPiF/rWNUGwET7rtRdxLzrW//08C8H8BSTpuT0HhIyLxiHWUZUAAwcUdnV
         matOGtGzXqWLwptb9c4qs1KIUguKIVvFFJyi2gMUmxeEj8fADIB+IVNz7bsn1VKBwqQp
         whqA26+Egzax7ppvW6m8yuw2ODsEmTqO3fR9SJB+g+A+psfYgYe/K9nxj0e1itqE72VH
         chNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518298; x=1741123098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClmqOl/Tw6JC6bZhWsysftkJJqIKxw8FKGY3Yy+YdFc=;
        b=NhznzeTFBpU7RF9Se5NIoyoMsMKdqrx0P37eqoXRYuLg3X160nHrnGDaoqrYrRR0HB
         9wH8HTrCZcIVMPc6F9ymFS4xszb6yhc+15afB2Mx64cSYJTBh59Q28cncH3x/+AOUviK
         JprELaonO3Om7cTua+jxxsBI29IMg7SYNMNqo8wD94i4aTNGj5Bul9U8ST/Y0X38RiCJ
         ttLwun0rn9eDA/G1Jav6iso4fCQfE8N8AwywnsxElsRyjMB9PxamZRTnpWTTDHrcP5vt
         dMrGyZevBrKNiF/Sq/YJqZI0mlpFCCs/Vy1os3WDfeLhagQQfWiXlJRydoBqr/K/u24+
         4fhA==
X-Forwarded-Encrypted: i=1; AJvYcCUyUK+nxBmp9CPlw63j7rb9b5f/bikDKCUtq9qTBUYC6tIJEzeXYMu90Mg5uQrDDCA/7ZKC9jGr@vger.kernel.org, AJvYcCWvBEdhFaBKLZxS0gHMKq+vJQpVUpYJkfpicQlASWgeYlCtXunzPD9xvaeIpClicfKiFC4gcXkV+M5B0Zti8pctQQI=@vger.kernel.org, AJvYcCXZG4fiMqWARvaW2FrwzRER40n9geeI+3jhnBAXUfHzCLDBJ5GJjsdDeTFJacbq7ymW1iLEePj2xmSQ2mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeetcVEKfSieeGvYdDtHa53ZkboKnrNFrDNHsohf2s2D8U4EQK
	lnz+U7sPZ18lkKpJxOLsJxHxsfpZkwGJb/qqbxpmig45u6pRJ5VUybwx8epN1tNubkPioPdX1kT
	/EA2o/TVkIQH83Sttz5rP9ZAfeC4=
X-Gm-Gg: ASbGncvpQ8pqwB/1YwgPHzJU5/I0c1Wv3gDp+CZdgRMDQefRjPJSt49HmPgqr65VVtO
	Atvq0LY1SjWrOWK4X3JFhwxDZOoS+ixUaZqyAUd1yflzmPeuyYuj/wQGNE2e6ozrWs5/eCvBEEg
	CXx9U6fWE=
X-Google-Smtp-Source: AGHT+IE1ro2Ea2GyyaX3xp2teX3THRLd4qkveKPG3P4FVT7E3q9jXm31Jo+kkD1ljGeB4qt1pCLbRlljtq0HjJqQfAg=
X-Received: by 2002:a05:6122:3c94:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-5223cd2c8a8mr3161652e0c.9.1740518297995; Tue, 25 Feb 2025
 13:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com> <20250225105907.845347-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250225105907.845347-6-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Feb 2025 21:17:52 +0000
X-Gm-Features: AQ5f1Jo2VftSleZ87D2j-IA4DPgIo3RBwdu6m9T9vVR3u6tfRaSwqq2-lvouTpI
Message-ID: <CA+V-a8scgrFTe5GAUDSp7_v0M+iHEXBqpmjnavnPrSXYeXOQ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] phy: renesas: rcar-gen3-usb2: Set timing registers
 only once
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org, kishon@kernel.org, 
	horms+renesas@verge.net.au, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:02=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> phy-rcar-gen3-usb2 driver exports 4 PHYs. The timing registers are common
> to all PHYs. There is no need to set them every time a PHY is initialized=
.
> Set timing register only when the 1st PHY is initialized.
>
> Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver=
")
> Cc: stable@vger.kernel.org
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - collected tags
>
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 21cf14ea3437..a89621d3f94b 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -467,8 +467,11 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>         val =3D readl(usb2_base + USB2_INT_ENABLE);
>         val |=3D USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
>         writel(val, usb2_base + USB2_INT_ENABLE);
> -       writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET)=
;
> -       writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
> +
> +       if (!rcar_gen3_is_any_rphy_initialized(channel)) {
> +               writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM=
_TIMSET);
> +               writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
> +       }
>
>         /* Initialize otg part (only if we initialize a PHY with IRQs). *=
/
>         if (rphy->int_enable_bits)
> --
> 2.43.0
>
>

