Return-Path: <linux-renesas-soc+bounces-27479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GArxDzHAeGn6sgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 14:40:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB69A9500C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 14:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1CDF73006153
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 13:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328673596EC;
	Tue, 27 Jan 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZodmSZzS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5AF3590D4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521199; cv=pass; b=g77L6xOd3gzNPU54KLSp2CU9F+HcBmh3BQj9jARC0L4YgeZJkAJv4XxTCy0+SBZzFQbwrH00PGUWGtzGC/FU4Y5Z10DowVVS2f2wyj2NFCnJyjYxgLNA1PAFJjXijYldYu1QyBDTdFCAmH+RGAtuOhCf/l4KeABLyDQdfrSPiz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521199; c=relaxed/simple;
	bh=NmJ64+sVhRlTVy+n9tWimJPXuaBxwQ0/c9YnNJraOrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmNDN15G6ULj6o36fkkeqy/0qPgmZTocSzpLjmiWpMtU/B43Bw068OaDpd2nyepFJahBZXs38FCr+tdVUHS8QA0osnXNSD0/JqqZrK+78dr/JfUkoQYl1ZWwgmn0zNxMJiPg5bPzIhvGD4fGbdA8cRqoLSmAgUUB4ALEOw+d41g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZodmSZzS; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d256c2e6so5456078f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 05:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769521196; cv=none;
        d=google.com; s=arc-20240605;
        b=WFHlG4RpL0tka4EHz5cHJ9sgXf9/vt+MWono1U17AIujg7rSNPT9L6bamSzMXifgOI
         3Hkd2Jcyzq7iO1bPCfEcYrNCkpRFmsgIKfZEPpo+Ohsxyf5aTa6+4wlA3UCX9HgeJR9F
         r3eJzgBiQGNChAeEO5s0gb8FFTLPcm6KZ0wzTI9OLEANYqdUfzJnzBXIr1qmI6C9I2sH
         2Tr5m6z1bg90u3+8+LeA3e7Aucw4+k9pBRdQHgJyI6nIMrzwtCjyzql5jftcQ/7ie55g
         dLr980BrSAedpcyVelSKKCA23oyqiNcQmpk2QIaZRuySp98u6c6uapy5bchNoyde+MYp
         /O0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=;
        fh=mOiLjONyiP5jlLawd9/BS7jTkWY9gMEt79/Nsw9XxYI=;
        b=RUsojF+yCnIqlyCnHY9HTdN9E2EdPBYC5fshgWLShZFwowkxU4boabswBcN22iNkrT
         72/K6VS0KZLJc6NDoQPaRcCBcAX4D9ZePCQp1vBJxcXXHxV3JcH7rUgej+hWt+lp7U2G
         q69vrrB0c3L1kgsw2Cp/UwG2k9KEVpvQNjXgxsTvWAj0HOM0wfk/IzmJz5iJel2RrtJ0
         jkjUPxOwLg2eBfpNk9a4Ypi7bqBSaSYZx8/mzc3inAe0L+fwH4/Os2gi02bX1vebt9FY
         zWITNL5N57aYhqO7HXOcl60bESkcm6YlAHAvqVVerF5VnPvNolkxmlLciZTh6FgrkNsL
         j8Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769521196; x=1770125996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=;
        b=ZodmSZzSDYtfDQJ/jQ3DpEwSD+iD72VXGhwhrYczJwLOXuECKPJjTMZwNzxS6peDM1
         16svGQOUZbXze8r+g9Yc1VupRRYt/mk0vxyilxggtF/S9pydvqxNJX7V5us8s9TvLt51
         dTxCICmwGwjdL5mqFQJYRZR2Fl6pzo5CyFlH5iPcGz/BUsWv70xhtwX9lcdzw7kyu0Dt
         tf+g5r32mwYmQIF/VchhD53vXUakjA424uOGuveu51N1/AaFF5CjYmLvP2xXB5lOHqY7
         /YWuyJXl/mhDfU/Kd8/2juVoeuajX5qpq2DMoZELMs9ywji+lkCd7o6C/IKktUAOdMT6
         8MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521196; x=1770125996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=;
        b=PMS1j3aT+VesW2XnFFBDOUtyRWHMqTCg+x/VTwWtaKtSehB97Sgb85/EGFYsws9TrR
         Q/+8wzvUjSeSy4p/pEGct83GR0UYO6CvpbXP95thZEJm2H04hPrqJhbGSCYTvmdxkavO
         h6hsKl6GZNKhu/y9supLumKwsqW+wxzfxfKSXLueP6IxmTwrCJCHZhAOYvlLacKKPTLy
         f3AU2ghuUpumqwo/hsibfm9A7uzpZYp2X7cpgzauDetbickANRhWd9hgDEfMrlUdrCFD
         DuSAhuU+PVLIS1XJwsy+hXT3PyO4iBT5jCRSXXs/8JRHgfQ+GU60QKwuTPpQt++ps1HO
         l2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKvSy+knAH9sLagYogsMhaZGsDW0u4nMhtgS7YEgc3jHKioCKdg4JOo6ZwdnPT/E4BvYgRoMZjDROFXLGbo73wcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlHsueKGKs/aiJ+UEeUh1Ag7GB8JWBAC3nQKTHbvSqit28XodU
	hDQgzT1b7ByoGpN53oxtUI3efa4E/cG1L+Y/Dj4MW1W29NlLq7tufoqFdXGlMuQHEiFAHZ1FBLu
	88fW1s7ZBULfpbcZh0CAFakzdXHIAjZI=
X-Gm-Gg: AZuq6aLBLhB0bxVb7jQmfEry+JJW1MjC/eNsFFUSZUoIkRH/qM9uH/AwRPKNUoP8oVY
	RO71WxsleCOiRBo+wP5CUGbSQVbh+fVR5ue9r6fxskzKAC81Fu3mdJCWRH1S+r97VdKijXLW3C9
	QooP4ZCQCc1x7roxG7Xd6kfwl5UnfKDN13x0mg0YvrqtArAs62vBPgoxteuCD8yBK78TO4b91xF
	StTECypf2nn+e0xg518unKOk/+0Al66Pr/mXX5Nb4jVGFI3TvpiSvBH+Oaigp+Ok+FQQk2HwhDL
	dm4/6QWbhCh0KBoZaHE6tZ6MUiUC1jVG6ARkuhX47UbJeYXsRY4scET0nQ==
X-Received: by 2002:a05:6000:26c7:b0:435:9691:d525 with SMTP id
 ffacd0b85a97d-435dd02bd66mr2596133f8f.13.1769521195749; Tue, 27 Jan 2026
 05:39:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
In-Reply-To: <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Jan 2026 13:39:29 +0000
X-Gm-Features: AZwV_Qi7ONuSH5cnoHQEqydQB-V8V2QfAv3cVDqg-9__qb79RGS2Oo_Iqp8eszA
Message-ID: <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC address
 across unconditional reset
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27479-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,pengutronix.de,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: AB69A9500C
X-Rspamd-Action: no action

Hi Russell,

On Mon, Jan 26, 2026 at 6:11=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Jan 26, 2026 at 05:25:03PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Commit 90f522a20e3d1 ("NET: dwmac: Make dwmac reset unconditional")
> > asserts a reset in probe when a reset controller is present. This reset
> > clears the MAC address registers, so a valid address programmed by the
> > bootloader gets lost and the driver falls back to a random address.
> >
> > Read the MAC address from the hardware registers before resetting the
> > hardware. Keep the existing address selection logic when no valid
> > address is found, and program the selected address back into the MAC
> > after probe so it remains consistent in hardware.
> >
> > Export stmmac_bus_clks_config() so the early read path can enable the
> > bus clocks before accessing the MAC registers.
>
> I don't think this is a good idea. stmmac_bus_clks_config() is specific
> to using platform devices, but the core stmmac driver also supports
> PCI that doesn't use stmmac_bus_clks_config().
>
> stmmac_bus_clks_config() handles:
>
>  - plat_dat->stmmac_clk
>  - plat_dat->pclk
>  - any clock handled by the plat_dat->clks_config() method
>
> For platform devices, stmmac_probe_config_dt() gets these two clocks
> from DT, and prepares and enables them both. So, by the time the
> probe function is called, these clocks are already running.
>
> For those handled by the platform glue, the glues that populate
> this function:
>
> eic7700: eic7700_clks_config() - this is called from the init/exit
> handlers. Will be invoked to enable the clocks by stmmac_dvr_probe().
>
> imx: imx_dwmac_clks_config() - called by imx_dwmac_probe() to enable
> clocks prior to stmmac_dvr_probe() being invoked.
>
> mediaktek: mediatek_dwmac_clks_config() - called by
> mediatek_dwmac_probe() to enable clocks prior to stmmac_dvr_probe()
> being invoked.
>
> qcom-ethqos: ethqos_clks_config() - called by qcom_ethqos_probe() to
> enable clocks prior to stmmac_dvr_probe() being invoked.
>
> So, I can confidently say that all clocks should be running by the
> time __stmmac_dvr_probe() is called, and thus there should be no
> requirement to call stmmac_bus_clks_config() in this code.
>
Agreed.

>
> The next problem: you place this code to read registers from stmmac
> before:
>
>         ret =3D reset_control_deassert(priv->plat->stmmac_ahb_rst);
>
> Sadly, the binding documentation is too vague to pin down what this
> is, as dwmac can have AHB master (which generates bus cycles for
> accessing memory) and AHB slave (which would be the target for
> register accesses) interfaces.
>
> The problem here is that if some platform glue has wired this reset
> such that it resets the AHB slave side, that will prevent register
> access, and thus your attempt to read the MAC across all devices
> will fail.
>
Ok, got you.

>
> The next question that comes up is that we have a perfectly good way
> that's been around for years to pass a MAC address from the boot
> loader into the kernel for any network interface. I notice that it
> isn't mentioned in the DT bindings, presumably to prevent people
> from adding it to their in-kernel DT files.
>
>         mac-address =3D
>         local-mac-address =3D
>
> The old documentation in ethernet.txt was:
>
> - mac-address: array of 6 bytes, specifies the MAC address that was last =
used by
>   the boot program; should be used in cases where the MAC address assigne=
d to
>   the device by the boot program is different from the "local-mac-address=
"
>   property;
> - local-mac-address: array of 6 bytes, specifies the MAC address that was
>   assigned to the network device;
>
> Given that these are interfaces between the boot loader and the kernel,
> they can't be deprecated, as platforms will rely upon these properties
> to pass the MAC address from the boot loader to the kernel. For example
> on one of my systems:
>
> $ vdir /sys/class/net/eth0/of_node/
> total 0
> -r--r--r-- 1 root root  4 Jan 26 18:08 gop-port-id
> -r--r--r-- 1 root root 50 Jan 26 18:08 interrupt-names
> -r--r--r-- 1 root root 80 Jan 26 18:08 interrupts
> -r--r--r-- 1 root root  6 Jan 26 18:08 local-mac-address
> -r--r--r-- 1 root root 14 Jan 26 18:08 name
> -r--r--r-- 1 root root  4 Jan 26 18:08 phy
> -r--r--r-- 1 root root 10 Jan 26 18:08 phy-mode
> -r--r--r-- 1 root root  8 Jan 26 18:08 phys
> -r--r--r-- 1 root root  4 Jan 26 18:08 port-id
> -r--r--r-- 1 root root  4 Jan 26 18:08 reg
> -r--r--r-- 1 root root  5 Jan 26 18:08 status
>
> where "local-mac-address" states the MAC address to be used for eth0,
> as specified by the boot loader.
>
Thanks for the pointer, I will use the above-mentioned method with
which we won't be needing this patch on the RZ/T2H platform.

> I don't think stmmac needs this extra complication provided platforms
> make use of mechanisms that already exist... and I feel it's time to
> start saying no to platform specific quirks that can be handled by
> those mechanisms.
>
Ok.

Cheers,
Prabhakar

