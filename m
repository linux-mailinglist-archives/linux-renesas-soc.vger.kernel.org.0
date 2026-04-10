Return-Path: <linux-renesas-soc+bounces-31140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCsEO8b/2GnDkwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 15:48:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C063D8539
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 15:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4A023007ADD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 13:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE543C5DA5;
	Fri, 10 Apr 2026 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWMmwwrg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53195464D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828600; cv=pass; b=FcRAjfUvAtZ3hZm9+alAtpou7G+Won7shGsgXyHbbybNkuZBB4UsElnFB4WAvHOLI2sQnneVTrx+gKJnWGpTAzs9EO+NiOV6XLfQgqiYeJcc+aJkJWO6sJzjAkVF/xNWrsIIQzUPnykLinQNzVKY3ate0fu3nMd1AqZYxOaadIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828600; c=relaxed/simple;
	bh=YgrJwTSrZYeSjVMNLPrgCbByTvZIfgpY1ecwu0mAL8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5FtsIExjwWabTEF3TjvVLyN6dXea7by0/rGL0YIcP3dPfIoitTJfhur1rfEhucMeMmNp5pkzJWYbe2ngRY6aZJw8LGpdXur22YHkC/oQcm53PNBupTXMP/uXYvtNXuMLhi7v6Q3NXiiY/MFyIFn/qpGpcE9ae1Fo2x/SqrH69I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWMmwwrg; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so1927921e87.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 06:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775828597; cv=none;
        d=google.com; s=arc-20240605;
        b=RHt0LLoD1Bn5yrpf1w+Zluar6EeHkIqH6Y88n+Tqdxklbcc4utAFbFakMn0hh3LVa4
         qCjtCoP5yrQuTNnTyA7kO30pxv0TQUwqGK7YRgjdDx2Y1atQTsW+0Rv+XFo8OtXQsspq
         ofSWDo8dNOQGqSFY6GQX1ITr4jPb35ClPNmagq4sHm6s41atBOBAg+JNrfXoyEfFnRip
         fMzzscGBoON1aGBLjP5uMV4c8s1jHPZErEX7uMcxw7bgm6DYjd2nnym8JrLcHabhFTqV
         M3hgnvge/tBTDQ/dtpKLdaVZOCE7p3PFJtmtfiOZKypJqWuv56Zd4J0znKJqFYO8cDtO
         aUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HPAqnqKcw9kNQQIwYNpoVOuQXD5LrODSPZaoiKKIlQY=;
        fh=CJP6GXUAyNlXL5sX4N39GbChpk+qcm1YtARRJOhyWrw=;
        b=fsP7xwF0vHxPRJHRcus6U90MQzZnpjqVqu6roqD0tO4apBPrrxn2pyexnYfnGrv7ET
         DKVbhLU0JIOpMsaUJxFPyWLe1UjymxpQHYpTx7znPhFsy4hXd0JIVxTLJcXc+7I2KCDu
         0lDV+R1mpzQOAWDZaP+pdo4DftkyFxdaj/NxqyLLSRRwAFokAoiUS88Arjq45xOg2UCx
         W5cgN44IPV59VyKlD+ak0gfzukx+W2EvuXY8C/y8RiDgubBJZkJBXRcZ80PHJhoPOkRD
         qr7DQ2Sx6IJUXtmZRq+NQL7n0uZWRGOKP1L5Zwin+ThQJGxjxMW2XEKw1wWnd8E7CgaN
         SoGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775828597; x=1776433397; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HPAqnqKcw9kNQQIwYNpoVOuQXD5LrODSPZaoiKKIlQY=;
        b=QWMmwwrgIdpLyOpbBKSD4kOefcSEohl0EWuNwH7j1JtVkHbAV5Q5b4ZOH+XPZHaClh
         /eErV4oHQiRLRwFzd3OK26u3qmQbqRB+OUS+NVVOtCmIYLrg0N8SJ2ZqsL2+gWt8gD+w
         03GocGi7QSrhsWwpzN+Zm9LQT5+sPAZ3aUeFNQ94pk/h0VEv3vEepJd9CshxqysoWLMn
         GL2BKGlPpj2IupFySWbtMFa4j+aPpWzKgThxadVBLOlr6NBvlh5n1wYnsjLVBdlcwsnl
         2WoiOCdGysC0T8Gt11A0i4WbZdgu1pCl6/Hmr6gua+oQucMTPe14w7AfRuw4MfvoDMvU
         tnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828597; x=1776433397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPAqnqKcw9kNQQIwYNpoVOuQXD5LrODSPZaoiKKIlQY=;
        b=iciTkXKNEDm+mwkUw/WnfuOt8WV5w+hRi6c9Z/ECK41NbTqChSUhsSzGGz4RN863m/
         1o97mMH9FX19R04HUusVvHt7ODJXDzFX93TO8HCQJw2O22pIT1srwtfYLa5OT7808GlF
         JdhvvdtbP6cV/nla06DKVA1K4sDxNwY/w46ZnSBLWHhHqbXV1RTOCmM0Kasm41iBkgQw
         4R5JfFVglBPPs5i8jEKCy7Uq2ZQECkLZEZDxDYnrialiuwOKQEgXUctHwdEzkJCAskfX
         AGm0IKhxqO0/ROEV9U7K08ZQ58ZqbNczf7XQIfxgQl3WvaWJPLV017S/dGDb76NgLhJ/
         +O+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCsGeidO4sqb9WwrH4pjOQbL0tqd8GsekbJdCDgRu8px1nAGuqm0htQYArBwctjIPEVJLjCqP+d3pq64IxxAWuWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6JKa1XOAMreDKWCirIb9DsER1u46uBNP/WW0Aty1AF4xE81YP
	ndrcjEzJVahJqGUHnVRcGpFKdm3JI+FCIu8t5zQlrrYHHQvcZeLZKnS0K/r0KTjXFlHd7IBjrwy
	yn7h702LkX8nbGjeUOV/ZvdVRNq8+ZkcFhQrrKllesd6lvDRNgLsn
X-Gm-Gg: AeBDievhw6vfKMxLDRdB5jFbs5NRZzxAoez1fhDgMbAHtQGzhUnI6phUTWlbO5LMLex
	LQzMrCIc4qZegS/xfHBR4qkCWMM3WjLbvab9aGP4hxfJFWS1/k0tkW7GXtf/hrtQmMRQWIFDfll
	B4+VFHgX/GygWynWx//zUwfLh/0oUQTDjv3MadX+hV8xSUBuuliFR767IfNDguD+nRF8Y3VMDCu
	xUH/HyYtW4/GHUfcUg+ce38NJS78KukH0pWZKXUh6Xae8TmD8mOBDIigUQ4x5Z/P6EUEC6kQmQ/
	wtqYpnxO
X-Received: by 2002:a05:6512:108a:b0:5a1:6c86:b957 with SMTP id
 2adb3069b0e04-5a3efb2c5eemr1409309e87.3.1775828596892; Fri, 10 Apr 2026
 06:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXHhd150mpUT5-VPcHW0W5Hs-rFC-Bjrc7Z8Szco9P_Xw@mail.gmail.com> <adZaXSDsv4f9d8Bp@tom-desktop>
In-Reply-To: <adZaXSDsv4f9d8Bp@tom-desktop>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Apr 2026 15:42:40 +0200
X-Gm-Features: AQROBzC3LoOCj70eiud50EVlHZzwLKUFJdS9N5jGny4APxuSZLpM8uhFac0vmsQ
Message-ID: <CAPDyKFpdafESpDDN_EaEQJ-5Kb+rxgzD9FYYCv8-+X4EJDd0=g@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add missing #mux-state-cells to
 usb2phy-reset nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, tomm.merciai@gmail.com, peda@axentia.se, 
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31140-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linux-m68k.org,gmail.com,axentia.se,pengutronix.de,vger.kernel.org,bp.renesas.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 43C063D8539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 at 15:38, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Hi Geert,
> Thanks for your comments.
>
> On Wed, Apr 08, 2026 at 03:07:44PM +0200, Geert Uytterhoeven wrote:
> > Hi Tommaso,
> >
> > On Tue, 7 Apr 2026 at 17:35, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells as a
> > > required property. Add it to the USB2 PHY reset nodes in the RZ/V2H and RZ/V2N
> > > device trees to fix dtbs_check warnings.
> > >
> > > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > >
> > > Kind Regards,
> > > Tommaso
> > >
> > > Tommaso Merciai (2):
> > >   arm64: dts: renesas: r9a09g057: Add #mux-state-cells to
> > >     usb2{0,1}phyrst
> > >   arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst
> >
> > Does this series supersedes "[PATCH v5 16/22] arm64: dts: renesas:
> > r9a09g056: Add USB2.0 VBUS_SEL mux-controller support"[1] and "[PATCH
> > v5 17/22] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal
> > regulator node"[2]?
>
> Yes, thanks.
>
> From v5 only [0] missing.
> But I think Ulf is planning to pick [0].

I didn't get confirmation from Peter, so I decided to wait.

If there is an rc8 on Monday I can pick it up for v7.1, otherwise
please re-submit when v7.1-rc1 is out.

>
> I will rebase/send RZ/G3E USB2.0 dt patches later.
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/cda933586ef7ca119dbbcef45a921c29dd517698.1775047175.git.tommaso.merciai.xr@bp.renesas.com/
>
>
> Kind Regards,
> Tommaso

Kind regards
Uffe

