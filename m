Return-Path: <linux-renesas-soc+bounces-32260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIKKEfW8/GnSTAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 18:25:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C65AF4EC28B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 18:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83D33300458B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 16:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9373B9DB6;
	Thu,  7 May 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFD5jiBe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F2E1FE44A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171009; cv=pass; b=ACAZ1X/k5DfQ3fvVMfpOYQ0ChsHSLGfL6VtiMUS1XBHGDBb+TGiuuBfG8otDRQjW4AWDYK7dV9pfceh/jJHNj/LSbCFKSyPx2NTP59JwMnVJN2CLBcSXThmC7lzLkZb2EgHdMJe4qv8drLf2nq784uB+ThkBMQvjDM0Bc6wuq7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171009; c=relaxed/simple;
	bh=78n13q0JxWmtufuvEqwAQZAMZxadvALvItN4XP7CsJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgHi4JwZGugCwWRz/DeB21v6uloeaXckeVazxeJ++1bxPWIHSTaLOBJipkAQCv2tWAdJeIYzNkX9I1u55vlTOZLzKXa1yCX8nH6ZAe8ztXJb5SgpRAoZL/SUf4mmW9UgXVMLGD1Q8ChDn7pf0FTgIfrJRgiVD8iqtSKT1IcfwH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFD5jiBe; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44da2de25f3so814544f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 09:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778171007; cv=none;
        d=google.com; s=arc-20240605;
        b=eZBuHjVP8vwcqQra0LnI2+OMcEcr66tnWyd52cxeDsrXSmBJgiA0I8AN3fBXtZSorz
         LJowpvXgzVGvxK8TagLpTvUydjI5nMmprhpx3nmlEx38CZI/pBfVtpSPOLe8J0pRj03z
         HqT6pVjmCvm3KbVPJ2olWaqR92IRGJw2JxQcLr0EgKnJDZxFWm6+rdpN4tDJg0fB54wu
         8k+Mx6TTVLSx3XGYRa+tL+X5I08vLuDxPGcoOa2DYQQG61RphO7CBTHgOCyTv2UfdLW3
         jIxCLnHPKREzbxKHMO4GWOR48qBMOkjCCEka5BLqzJXs8wGZQ2i4EeAHQGVcXd+2Vv9e
         hMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=78n13q0JxWmtufuvEqwAQZAMZxadvALvItN4XP7CsJ4=;
        fh=W5RdyqTmrlLdYq9XSH8Secv6P9LuJcIy1klv+TPAI80=;
        b=bpI5Zf9sOvTtw+yU3B/2f6AsVVO6LkiYSBsoduksy1yUR70twyTaVhVGupZ4Hpbyhd
         KbseBOkx5QVjngyUOK5TgP9IFMSzyKi+kGlzA6awN4iV+Z+loqt+wepSa4+PfKL5ivRp
         uGiWsgRE1w1SlwFNToQWZbVuLLZPW/MtawEygn6IqoYYw7eZHCUyuFWpFI1LvtbTpk/G
         4x2a7zFYJnyW3T09Cc/l6ZaYa9tjpr/P6WSfJl0d/c+lhcIzR46HNXDCtrMEnLowxJCS
         8u4UTvkOr6BA0NTnR26axSc0n20mzVI0X24Zr0hF4lEF3nQehS+oAG5N2PQEauXxXAeB
         nTjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778171007; x=1778775807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78n13q0JxWmtufuvEqwAQZAMZxadvALvItN4XP7CsJ4=;
        b=RFD5jiBeugTjgunOG6HX677AfZppbuHbkSeDSdFJ7bzInULv/CbzlMWYdh5b4vWkND
         W7GYSoXqvpfo3rYs3ESi5wI6zaMGMKJiDpK7FLd4jQ0G4xhBxc/oN2YTPeR/yA2zdj4J
         KaVoqPzzxx2OsBWc/nY0zIHjnIZWovd7PF9rQWakA3g2Qg7nHw4mFfN6HPKpjqu3AzVT
         xzvbteQCBzQLhVpLTREckvLp+rOm12jKH5hDhfSyx59xT38FjKlR2iOx04v6s7RI7hka
         c3zMa7tfx+17AF4CPgvr18Qa9YsOVHXqdDKXriqzJL0BAULl++L1DtlLqMIg8ojs90SA
         cxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171007; x=1778775807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=78n13q0JxWmtufuvEqwAQZAMZxadvALvItN4XP7CsJ4=;
        b=sqGqsZ1qLd78o4x8z400J4b675/BftQDliMg8DLVBBcHAoA48dlyVCPf385Y//DjlY
         Y9u9rmHqD3i5eX6syJ+3a0MtoLc5eZtwtqZrN/C0rdOA6kqnNNvgQLO2af3WwLyO2Jvy
         JfTeqjuv8J2CSW7tSTTPFytkNOiWeWCptLKP3A4gk8juN7TfC32SRwRYh6KjTx4mWP7V
         FNAMaewlZ51o2OWV3TZ1qgzGqLgsPscofRoHbUaTcq96aHydjQU/2DnKV/RXIDaTDOpf
         UJEJ6n6TWMRrX7Z1aiXbXYshiKLljHtZ08Xps8ULFgtohxkRd8yuam8oaQrJr/9LAril
         fF5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9VeldYezsEfdjcinu5ERh4Q+yrEBZFKFbGcNXnPYkvP8TbaCjgVD/lENvr7CwQnETs3PassOywe+6mPMgI6zma0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEJagp9jG3I6CxPeYZ9kZJMPomYOhT6yK8NP5cUEpp4r42yq3s
	MDhqsyMhMsZ70W8TeK8LAnuh5d7k3F0l+7r8Pew+UrtW8TAa6TEJy4xQyqxRGTHyw1LwtKwsAax
	wuilUjYhw3AYp9wabwGjKOrYAUuNHvbk=
X-Gm-Gg: AeBDietN2eXgd+cyu22jKvLm5HZFDtKTjin20pgZ10P6wsWx61uzvhsJgNj0KPmC7Mq
	39JKheryMBHkryDZ7DC9sR5VETK25knNidVojgLGR7vc2IW0+rG+fooXG46zcDs2IgG8G7SkISz
	DWgl5TWFGfxv+YqVmujGRSvg/ZZpHG7l9J2MXEW/1KhQxByTIZHqwC/xY1EhW/MvP8epWIxEnnw
	VSi/fX94yLRQThVlH+lwJ2Dhnv1zxikPknsYxJkiZPl+fRZXsDWAZn6Xgv0t7V9U9r5qbaHYXjl
	WYsFLZUnjlN5/a7QjHxyPAMuO2n8pneBC4dkFm7VxhmMzHbVhK6AJsxHfcxOMNmSijipNA==
X-Received: by 2002:adf:e786:0:b0:451:bbe4:b48e with SMTP id
 ffacd0b85a97d-451bbe4b4cdmr9706562f8f.5.1778171006277; Thu, 07 May 2026
 09:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506195002.GA1778786@killaraus.ideasonboard.com> <CA+V-a8u8=mfR0zDJRNMEjnjrzFVAkOrqtro05Zgd1JFqGRByKw@mail.gmail.com>
 <TY3PR01MB1134676FA7479724BDCE40649863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260507103830.GM1778786@killaraus.ideasonboard.com> <TY3PR01MB113460CD4F3609EEA898FE648863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460CD4F3609EEA898FE648863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 17:22:59 +0100
X-Gm-Features: AVHnY4LRMvX5NWqGQvTosoP_Ri2LYKGR7IldmZ4eLshJruHuK1dfbRXarsoS31o
Message-ID: <CA+V-a8t+HHYNxet4Od9F2Hk980kQ5yfru4-hF1f-6i_yKZGN0w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H
 and RZ/N2H support
To: Biju Das <biju.das.jz@bp.renesas.com>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C65AF4EC28B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32260-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.189];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Biju, Laurent,

On Thu, May 7, 2026 at 11:54=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Laurent,
>
> Thanks for the feedback.
>
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 07 May 2026 11:39
> > Subject: Re: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ=
/T2H and RZ/N2H support
> >
> > On Thu, May 07, 2026 at 09:24:48AM +0000, Biju Das wrote:
> > > On 06 May 2026 20:58, Lad, Prabhakar wrote:
> > > > On Wed, May 6, 2026 at 8:50=E2=80=AFPM Laurent Pinchart wrote:
> > > > > On Wed, Apr 29, 2026 at 06:00:09PM +0100, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Document the Display Unit (DU) support for the RZ/T2H and RZ/N2=
H SoCs.
> > > > > >
> > > > > > The DU block on RZ/T2H is functionally equivalent to the RZ/G2U=
L
> > > > > > DU and supports the DPI interface, but includes SoC-specific re=
gister differences.
> > > > > > Add a dedicated compatible string to represent this variant.
> > > > > >
> > > > > > As the DU implementation on RZ/N2H matches RZ/T2H, describe it
> > > > > > using an RZ/N2H specific compatible string with the RZ/T2H comp=
atible as fallback.
> > > > > >
> > > > > > Unlike other DU variants which use a multi-port model, the
> > > > > > RZ/T2H and RZ/N2H DU has a single output and is modelled using =
a
> > > > > > single port node with one endpoint. Add a port property to
> > > > > > support this and update the allOf constraints accordingly.
> > > > >
> > > > > Wouldn't it be simpler to always have a "ports" node, even for
> > > > > variants with a single port ?
> > > > >
> > > > I agree that, from a binding perspective, always having a "ports"
> > > > node keeps things simpler and consistent. Biju suggested this chang=
e based on earlier feedback for
> > the RZ/G3E series.
> > >
> > > From G3E feedback, I got the impression that going forward all future
> > > SoCs needs to have single port and multiple endpoints. That is the re=
ason for suggesting port for new
> > SoCs.
> >
> > Right, let's clarify that.
> >
> > TL;DR: it depends on the hardware architecture (what a surprise :-))
> >
> > When reviewing the G3E, I noticed that the LCDC has a single output tha=
t is connected to one or
> > multiple encoders, depending on the SoC. I think this should be modeled=
 in DT with a single port.
>
> OK.
>
> >
> > Note that this does not preclude using a "ports" node, containing a sin=
gle "port@0". If you're
> > confident enough that no future generation will require multiple ports,=
 then it makes sense to
> > standardize on a single "port" node and no "ports". If, on the other ha=
nd, you think that some SoCs
> > would have multiple ports, then using a top-level "ports" node uncondit=
ionally would lead to simpler
> > bindings.
>
> OK.
>
> >
> > I'll let you all decide what you think is the most suitable approach.
>
> Thanks for the advice. We will use ports that will make the binding simpl=
er.
> We will continue to use ports for SoCs which has single output connected =
to
> Single encoder(RZ/T2H) as well as multiple encoders(RZ/G3{E,L}).
>
As agreed, I will switch back to the ports property.

Cheers,
Prabhakar

