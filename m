Return-Path: <linux-renesas-soc+bounces-35213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3f7gF4xRVmpK3QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 17:11:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD40A756440
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 17:11:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59EC030CC199
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E12D48A2DB;
	Tue, 14 Jul 2026 15:07:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D69494A0F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 15:07:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041676; cv=none; b=MnDH2XWK8ffxeBzK42YVmINdmDoYgMV1jttJQDqOW7FCYrOTzGLKWvruv47Mt/5A3w+m31F2+bLiEac+pgsj9cgIG2p/iCfeCGj7daWoEMB4bh8SZV/jZIm38pZFVDQI/0D4V0hw+fGKqEjePhYnAvalVF0VJS3VQveXkYlQwmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041676; c=relaxed/simple;
	bh=EydTAVFmfsnxHYlpbg8UU22Qc+XHEBpnj2CpvQQHEJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLeIPmDCCBl3i/MqUO6SzZCbNELofb6JUaYOr0Ni+GFhBz2OeIO/A51pOCspJv5J4YMQ5Q/yQWAY4RmSYSG26ZI1bbWlXmpXDby+2vr4jq+Wp48vKigduklr4LiAM1VNKcIcRZSdJ36Q/WYq2zhw3oIpFTzaZIe3qxA7oI9ivrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so514419666b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 08:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784041673; x=1784646473;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jo5VGLZCIAx58XGGknenbn6fKSICDfYV+/5FruvF+xY=;
        b=AzXWmNn6MBolJdfEYk0fVFnD0lYf06rnzoaPxLcGU4agqFm+U/oO0sUXAVH6H1y+mY
         a+NPtR9B4fF0GrrF8uYTBJWNlNLjMkWrKbQM07vhw+wjjUzurMNMXpcISWZdQ8UcADMR
         M96kypULlThoB97YSGeCN13N2PoXZx2OHdodKn/pcFX/VtYlQFoCov+X48MiQYTsuA37
         0igGKOnjlLZD+kysHTsF6B9Jxy+ejX8gkzN0bIQ7ADNFwJY6fx8qsMLkOXoT3tUC4MYo
         47MnyQ/C7T8gDmeDwfggjltrim/lX40a3crH94v1qwpROVHWSkrl5XOLaGldIQ/XL+Fg
         9Czg==
X-Forwarded-Encrypted: i=1; AHgh+RqTuWpXjlNOQrqrxcUUp0wUKDRPD3D3gCBG/G3zZU+/7et9PZ6zgK67kWCc2Le4WfNl5m6oK1YD8GHTeg/Ai7E/uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnYQl0JtZpdccUpfeX6lljn42Yb6OKIks0zhurrNRLujfSAyfH
	IK3zEUBjAt1z/VApbZ9AhQlkvk8qhvgkLYZtD/3F/aVx4Pdqm+m5C54udN2vku7Yv+w=
X-Gm-Gg: AfdE7ckncA21oXz1CJwHHmxYjsPLvMYkpHZFAgmdcIccEG+vO6u8rDZP7apeGakHvQv
	R4GYa4TMC8+hy4eXiO03lTEVPqozut3bHkwIykEvBxstAfCtZxI63wP4x/B++lKsX5RkCFt9LkL
	IROHQi/kDqw6SWC96f+ciVEN390tD1L4Aqqf2Crv6kUll3RFef3Kk7Cmj6huuRlbRrDjp1hZs8d
	qlS1nGjiUAcNmBAuQS4sCfwKCUl6piOjY3ae3Bcs+1iWTd/swAr9Ztt/UhbWHXPgRpKImBRxTNL
	sOYutD7uDM/JqL25HLnJcB9m2oslAFOc5Q9FAaGrM2FbvjypixxafEFLGgETC2TQaqt3VpxXfbt
	23ZtmScB3zgmyvTHHTe+F2CcNxFmLGMwRBvLTehEsg/IjBkbXld3SeUGLbwOyzFKnKCub35Xw1J
	rjbbTmxNfSLXGiR3MXvYlAoK/ZbBVdVCT4yuo4Q88O/Upc1XOE/w==
X-Received: by 2002:a17:906:c115:b0:c15:b67b:523e with SMTP id a640c23a62f3a-c161e8d2f0fmr655895766b.19.1784041672541;
        Tue, 14 Jul 2026 08:07:52 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2922f91sm1723259a12.18.2026.07.14.08.07.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 08:07:50 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69c7c8accffso5044026a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 08:07:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqyFpk8r3mA4Ci4DLxsIo4dlT46u8MiCcxTulnrQeE2CaA6PSzV4Zw7Du3QHBxMwFVghEiJuaB2OBximMCDLL3wuQ==@vger.kernel.org
X-Received: by 2002:a05:6402:5518:b0:698:1504:e3db with SMTP id
 4fb4d7f45d1cf-69c5f12584bmr5921618a12.29.1784041668249; Tue, 14 Jul 2026
 08:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org> <20260704202748.355708-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704202748.355708-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 17:07:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVqw-gqydVg5N7WiMj04rVAPuLjJjzgrk+eEgJpbzS2g@mail.gmail.com>
X-Gm-Features: AUfX_mzNY37K7gCxxfwbxm0n7Y10BRypx8qySLz8CYFaayTElsV73S_ymVmDRtU
Message-ID: <CAMuHMdUVqw-gqydVg5N7WiMj04rVAPuLjJjzgrk+eEgJpbzS2g@mail.gmail.com>
Subject: Re: [PATCH 4/5] PCI: dwc: rcar-gen4: Handle PERST via reset subsystem
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-35213-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,linux-m68k.org:from_mime,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD40A756440

Hi Marek,

On Sat, 4 Jul 2026 at 22:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Handle PERST via both GPIO and reset subsystem. On R-Car Gen4, the
> PERST signal is operated as a GPIO, on R-Car Gen5 it might only be
> accessible via SCMI reset via reset subsystem. Support both options.
> This is a preparatory patch for R-Car Gen5 support.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c

> @@ -299,10 +300,27 @@ static void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *rcar)
>
>  static int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar)
>  {
> +       struct device *dev = rcar->dw.dev;
> +       struct reset_control *perst;
> +
>         rcar->phy_base = devm_platform_ioremap_resource_byname(rcar->pdev, "phy");
>         if (IS_ERR(rcar->phy_base))
>                 return PTR_ERR(rcar->phy_base);
>
> +       rcar->perst = NULL;
> +       for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> +               perst = of_reset_control_get(of_port, "perst");
> +               if (IS_ERR(perst)) {
> +                       if (PTR_ERR(perst) != -EPROBE_DEFER)
> +                               dev_err(dev, "Failed to get PERST#\n");
> +                       return PTR_ERR(perst);

return dev_err_probe(...)?

This error condition is triggered on Sparrow Hawk and White Hawk,
as their DTS does not have perst:

    pcie-rcar-gen4 e65d0000.pcie: Failed to get PERST#
    pcie-rcar-gen4 e65d0000.pcie: probe with driver pcie-rcar-gen4
failed with error -2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

