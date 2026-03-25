Return-Path: <linux-renesas-soc+bounces-30233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAW0GCzSw2lLuQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 13:16:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C9324AA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 13:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D058330DF05
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AC33CFF67;
	Wed, 25 Mar 2026 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnHRw1jp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8623CF661
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 11:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439683; cv=pass; b=VPXni+ysI2ROTkmgsXx/zXOZk5pXYj4l46PF7diGg4YPKybCkcX2//tPkaKZnR3saPSWiBZ4wqTiHUrmT93UctPsodlmagk1HDbE2kzHqTSjHeio88y5CSelEu9WYNeneouej7OpEL/Rg014gxfyh7mCUgVQrrp3Lo2phXybJCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439683; c=relaxed/simple;
	bh=0MrcNmicBRchhkdmfDJ8rKh5Sk2NMVxCsAhKDXICGBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yo/792iURZDfKMGbo8ulkZropt/8aL1EfVjCVkqiUYBz2D7gf+4Md40NxoR3xw9r7TVuw5HVNC2lqM48rEVsBMDiGdaHYwun1xtxoXNUjTjRsuptq61AobGGz9spQGuCHN2P9enyp3F7eokDcB+f4FsFxsjeSiup9fmlTnDOT7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnHRw1jp; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b94a19fdso4669360f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 04:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774439680; cv=none;
        d=google.com; s=arc-20240605;
        b=DZVyP/FyKVBPnsGNWCW7LWhZePLGnpQqro2uOotANP+pY7h3J6gKvZ486UOBZeCLBd
         ML2/UGf3jIfFSoi7ET61YcVD5JjZ6PW2Wow23CeixtSXKHAoe8vZd3FOITs5996BwuPX
         7OdWlIVDMRzbamfvmxW6Tz1lcQRFr4qKEKTG5IVpbI+23uVrRbR4EgtyUkQhgoqsw5bS
         kDtk9/QIxk0PWhuhUkFZArG8xfxTvqDB/r/WIAjUKcsjxiDKXb5aR9giEcrp6+bV7NhV
         4dddFHI6N3oWQ1qGfBY5CLjIjM50K7IihCFntlQdf2uME3/ovG0QAFJPryV7xyj8jYgO
         TqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NTtiC/H6aEdIPYVK6aeTMwBZxiD7QRg2sxYnmAcsygw=;
        fh=PXH7w5q/BwDFT6GYYhgUfMu/C0yCMcZd4heBzWO//Y0=;
        b=Un0qTJfbWpreXjwOGaMA+avVz8/16ywzRa/RFvi73NjtUdaCzmRyeVfV4Of8V3NH/X
         kDK7eR5So6iRuPXfW/8QHpTfk6NNqEvhtsF/ApcWI0/zKi0nDo32/8ue2ytT7TtwGyI9
         ne0/WX/QPnvPpddvXtm1sjNxR2X2G94ZJxqh3KGklZ8vjf6Q7b68vg5UpXOrpa4JNLum
         JCDBDObOaogX2S8l/iogdCbYklikmuyylQonAOTrVVZXxO3Tt4g7weUeO+Tzsrv46VLT
         wsA+rEJSJGMlKofAzV0K5fQ38OZ4LVDGhMv5B91dL+DyOuaVZ0E6pK8u+FG3fvO1G3iI
         HpeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774439680; x=1775044480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTtiC/H6aEdIPYVK6aeTMwBZxiD7QRg2sxYnmAcsygw=;
        b=LnHRw1jpt+J9xTzRv1r1iLrPWnz5wzfWKLV4MV69ZmXAtUXYmMOw3cqkseXOQtE/ky
         QJ/cedw4xkmEZuNkoF6nLlK76x1NH3yzueuzl0Jp1kOidwMPYy+/wL9Y1a2eGIxVfbR/
         D0M+C37vPjnUyt1xTLxzZToS0UWu1PnSv9eqxEI9RDvn9hvM4M1oI68xO4vlDNKfmUMk
         W2+HbU0EAqF2w/TDD/GwjK0qKkdP5rgfO/gHOq1yTXEmP70LybTkrUG3ssF61dvVpaUL
         rIlJJWZ+pjNtpfRNGxr0PUv3iJYep0JAHQEhe6W5FNGYQR+G2T2AO0F/fDL9tM0DUwAB
         r3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439680; x=1775044480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NTtiC/H6aEdIPYVK6aeTMwBZxiD7QRg2sxYnmAcsygw=;
        b=PoOUh6or92fb8oJLNekNUD5CmI9KFpwZpE0pMLVUPnuowPu+NYyQyAew7ivMahJSsp
         m7SAb25pS6zxKGp3NAgGW2NzByRTSUT5Bk0zEtOY6XSN00n6y64PAl72+fS48sZhVFqT
         weMYsBvymLmetDwl/2MeeSfaoDC2o2haAaFfUEC/fBymkLhdr2Fs/79WZ11J2ZSZdbu1
         VZTOY8BI+aMrf7O1dARnrTYcB7FeDN2nbsrDwUrJErNnhKgB81XlAu9N4bTP2I2zx1y2
         E5/POBCIRIqEP/PcId2OyfVOTwxD4ro3wsLnAOa4J172MNGs8aDT4yj9j1zTF10/v47/
         JdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUrXyFjsZE4VEjSe7fhx/NTEyrXwjFUi3ACYpiMBXQvxgdkH/vmWaQn8dmE6xpViK5yDp27IUu7Pf2U4goB1AElg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYJyghOfQBKzxGxbRGqPhLKGZwuGvtOtkhGlf3lx4f7dUiTblm
	ieNCSuyDu6oOBUTvnkAMOMsl7WdLqi6xnlr+CjZf7eKpGli4eS/ZXNNsR2MYUTs5DWOFhqsoJiC
	ns9V5TSFk1MAD0WOyTAykF8b84PVC2u4=
X-Gm-Gg: ATEYQzxlx7XVaQvj0fyrMovdUEOfvIIiSdRALrdkXjxJlMwSOnqDmUmcUgya+nyHYIh
	qzPFFBF8FWC5fu/5AEQmHK+CBmIIsqAg0DC9KKMReL7xWBHUL7XvdDePrMaGIfthRZ3tvmD0ANq
	26oBK7QfJ029WK9bcyz1Td2OcnEBvm8ONWb2ORD7pIllcE2SUlYVsNeV5hn3Z58ssyVF/g3Lc08
	+t0mt3Ax3hDoqFCi/xgOstiqr47hKlv8coQQBp4MipbjKLgr52H2VOVIYO68WFkQ4DEpYjjb3vt
	EqeRecfe+mlC6/dkrsUEP/C7Vfc9L7sZuPVtVHM8j/bSBhJauUvRl8icz6rgAGaMI8c7
X-Received: by 2002:a05:6000:144f:b0:43b:42af:75e with SMTP id
 ffacd0b85a97d-43b88a1c6e6mr4638167f8f.44.1774439680037; Wed, 25 Mar 2026
 04:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <c2c56940-e14d-44fb-9b9a-9aff70998bd7@tuxon.dev>
In-Reply-To: <c2c56940-e14d-44fb-9b9a-9aff70998bd7@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 11:54:14 +0000
X-Gm-Features: AQROBzCVUCaqQkG9OKxvNMfyAeiAVuBU-qZHdIwjDOsY515WjKNxFvBFEZYatKQ
Message-ID: <CA+V-a8tv7JG6TJY2FfQweNd04G6Vm-k8P7tYNbajqca_yZ6vrA@mail.gmail.com>
Subject: Re: [PATCH 4/5] PCI: rzg3s-host: Prepare System Controller handling
 for multiple PCIe channels
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30233-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,tuxon.dev:email]
X-Rspamd-Queue-Id: B81C9324AA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu,

Thank you for the review.

On Wed, Mar 25, 2026 at 10:19=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@tuxon.dev> wrote:
>
> Hi, Prabhakar,
>
> On 3/18/26 14:44, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Prepare the driver to handle multiple PCIe channels with distinct Syste=
m
> > Controller register sets, as required by RZ/V2H(P). The current design
> > stores a single sysc_info structure per SoC, which is insufficient for
> > multi-channel configurations.
> >
> > Introduce channel identifiers and extend struct rzg3s_pcie_soc_data to
> > hold a sysc_info array indexed per PCIe channel. Add a channel field to
> > struct rzg3s_pcie_host and select the appropriate System Controller
> > information during probe based on the channel.
> >
> > Keep existing single-channel SoCs functionally unchanged while
> > preparing the driver for RZ/V2H(P) multi-channel support.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >   drivers/pci/controller/pcie-rzg3s-host.c | 48 ++++++++++++++++-------=
-
> >   1 file changed, 33 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/con=
troller/pcie-rzg3s-host.c
> > index c61e011f8302..a629e861bbd0 100644
> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -241,6 +241,18 @@ struct rzg3s_pcie_msi {
> >       int irq;
> >   };
> >
> > +/**
> > + * enum rzg3s_pcie_channel_id - RZ/G3S PCIe channel IDs
> > + * @RZG3S_PCIE_CHANNEL_ID_0: PCIe channel 0
> > + * @RZG3S_PCIE_CHANNEL_ID_1: PCIe channel 1
> > + * @RZG3S_PCIE_CHANNEL_ID_MAX: Max PCIe channels
> > + */
> > +enum rzg3s_pcie_channel_id {
> > +     RZG3S_PCIE_CHANNEL_ID_0,
> > +     RZG3S_PCIE_CHANNEL_ID_1,
>
> Just saying... based on Bjorn feedback on patch 3/5 the names used here w=
ould
> have to be adjusted accordingly. Maybe controller_id? Same for the other =
patches.
>
Agreed, I will rename it.

Cheers,
Prabhakar

