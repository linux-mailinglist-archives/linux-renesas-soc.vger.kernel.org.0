Return-Path: <linux-renesas-soc+bounces-29225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKL6JziWsWnkDAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 17:20:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995A26737F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 17:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3072301D0C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00293E1CFD;
	Wed, 11 Mar 2026 16:19:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7C23E123F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245999; cv=none; b=Wi31Mb6BPYkxByBaGEknqeLWMRZgw3/OhTS7U+61GANYATiQyl9cPhLnM2Zm7sOM3+HOFaXNEF9ntHKmcr6BDdchpSsEaQmizVQEKGTHy+gO6iToUJ9OYmJRgLIsihN7cKWe/7Oq5UDZ0OadWRlZ9Jj6fC1Vxcw5Qd8/xqgdxQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245999; c=relaxed/simple;
	bh=kriQ31pznimK4X2P3ovzVVed34liQBkD34H6iVN9D1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1qrQXBQ8gb2HTfW9qV5EPUj2WI6XnBzJ1PtQZLf4vdri5xE3T0TnO2J+zWD4yDSsAsVfLBEPzFqr0liyxN5Sy+TfztMg7M8Ji1qc7pDKocQW0WHBx9RK+sOgyy9JzLImWFLQPtUMmT9fSjONwkUj9ej1F7MUxAQlhCIIKYxsvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50917e02472so240341cf.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 09:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245992; x=1773850792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TZQnjO7g8xVtwDHS6cEDEA1/Z/EJi3b/CK0eN89lxs=;
        b=dmmljuOEW3Nv5NnhV/fjm2iClR2Mdscx6RJc6eIHIfTEbzbKhwQ/tZXtYQO/5416R3
         woRaWapRtDOXam3VsRKKhnM/PsPejSrfmXDpmtVHf7VM+IVtVqf1I9WSP+uTIQn3sOKP
         SGAjHVReWnfGSRa15OJN1Uxy06DP9g/ZKwEDLZxuFUBUC7R4ht/xGBYTBBXSblQwwqRE
         sQH/LaINAwy/63DGk++r7KuzNJp1lUKVPFbP5UkhCoqaLi/yf4cm9RD7tpr9wLZNVTC2
         eb9sEZIZFO3U3P3AlOR/DBXpKjtbxBkVTZgHohI9JTIuKaNkoOWO4QrHXI5Av0Wlfdos
         im6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIcnOGEnhvJOkT9mI9aPIAR1tV13cnCQt8nMz4IvFKCD/OZTbKqpCBMeETcuBGl+9Nti/ptaa5FnNomem5+FniBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy983TY6chU+f2euB0G7+0Y6n5Ot+j8lW+BDIXBHZr7aHBEpUXq
	+e45spgqLWLhdBqJXbNKlFrnCiAVfs6Sg4DRJuZSUD3YQGVRViBnCyoo8tYRy/+BPqA=
X-Gm-Gg: ATEYQzwSy+4WXs1L4nlseIhHs8Rp+TkqU2DUJrV6CrgvoF1INZeF0DUDymaP2654C7K
	YXknRbzRYrOcsnk+3EeczIlKAKmCNTG5iDBOpGQ/larLTucE9SXn6mELZBHuC085g6yCdnsO5yy
	A0siCWzC1+q6asy4PycK12rpA7FiehvgVxeWcjd8aEoWt+DqaDxV3B1bjbBAFfgCqJCyMNsfguZ
	hUuoB20UePh94iCs9uaqKGzZYr1PeZ45T6i3Z3NIJUbhBIRo9VVwAtnecJjov2Q0cabJT5sar7L
	L/slBRkZfHgCxpbH4r99QqFgs776EBsL+QNc7LFWVIAQFU6bDim0lPRA98akwxEDYcbj45Cdxdd
	yBu0wNkcgLcNccgzgApZU3JxdB8/q361+WJAM5XHh7/KObTJO9eDwg1SXjSvVMOf3rlxRwYcTzG
	y4J0BPtph3hK3kcam+eGH5r0EzT1oJFCR7MFUg/SoXJ4EANa1zzeeTKxHZMfncW0Cf
X-Received: by 2002:a05:622a:448:b0:509:211e:3624 with SMTP id d75a77b69052e-50939f6c832mr40022301cf.4.1773245992521;
        Wed, 11 Mar 2026 09:19:52 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0f3ae0sm15297741cf.20.2026.03.11.09.19.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 09:19:52 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cd858e860aso495908185a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 09:19:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPwjybVRunq0ullpdtfNZ5g+BFZPPuDFjdjFGLfh6SPI63gnxb/uJn56dnKEhjUHg+6NVMbKguKCXY00I+aCiIow==@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:5ff:d192:ff22 with SMTP id
 ada2fe7eead31-601deec1db1mr1359334137.19.1773245554633; Wed, 11 Mar 2026
 09:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com> <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 17:12:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMCqPZC2o8GMaRkJVTE3-FAtbPB3h_aDjpND6s=FWbZA@mail.gmail.com>
X-Gm-Features: AaiRm50HgMmG-2Hd3S3CzPU1H5WBB19C2AdyrH6AqIP1ufq9nQI1hgHf7Jj5-NE
Message-ID: <CAMuHMdWMCqPZC2o8GMaRkJVTE3-FAtbPB3h_aDjpND6s=FWbZA@mail.gmail.com>
Subject: Re: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be, 
	krzk+dt@kernel.org, robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org, 
	magnus.damm@gmail.com, biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29225-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4995A26737F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

On Fri, 6 Mar 2026 at 15:36, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> Enable PCIe support.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -122,6 +122,11 @@ key-sleep {
>  #endif
>  };
>
> +&pcie {
> +       pinctrl-0 = <&pcie_pins>;
> +       pinctrl-names = "default";
> +};
> +
>  &pinctrl {
>         canfd_pins: canfd {
>                 can1_pins: can1 {
> @@ -167,6 +172,17 @@ rsci9_pins: rsci9 {
>                 bias-pull-up;
>         };
>
> +       pcie-clkreq-n {

Please preserve sort order (alphabetical, by node name).
No need to resend this series just for this change.

> +               gpio-hog;
> +               gpios = <RZG3E_GPIO(4, 5) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "pcie_clkreq_n";
> +       };
> +
> +       pcie_pins: pcie {
> +               pinmux = <RZG3E_PORT_PINMUX(G, 7, 1)>; /* PCIE_RST_OUT# */
> +       };
> +
>         scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

