Return-Path: <linux-renesas-soc+bounces-27487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHiSLrTheGkGtwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 17:03:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEE397519
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 17:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 378A73006133
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 15:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7E21E8836;
	Tue, 27 Jan 2026 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cE3dOsbI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE435C19D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529328; cv=pass; b=FDbjeb2CdfKEQahMlAs1Sm+gPlj133JqWCHaBuRyUohFUiH3cMlUhVcw2rjLmW4NRZAlxBI72nQ4az75zz+pOzfZQAADy/lFnSATbasop/Vs6iiWb2oqRX+w+sI5RMVydByMmuCvjyKQYVPAaXFouVmk9kwADCLKpgiBqZuWG2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529328; c=relaxed/simple;
	bh=ECZkfdjxMvGWu1OAl5cFKgNEi43tNjoGV2hwyoXo1R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9mXg7k8wV3p4H0EK/3BTrmZMSaG7I2uV1VRNntN4TpBIzeUlrCJD8slRv+BrZp5ZjMdEEugpkyNysBobPl19OiRQ7I57COIReaif/JBo/BWoN5l7CYMiQUiOe/gOOQceRL7dQLfSDHrPZ42sg544CwSNdS/cEBManLxTNMv4N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cE3dOsbI; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432d2670932so5360312f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 07:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769529325; cv=none;
        d=google.com; s=arc-20240605;
        b=Q3U42OZtXoKdm9iRgZyP6Mhmvg8TuW24X3qO4fRRokJNebV6j7j3pCsmGnMgZ5PgVY
         Y34YmEOVM1vFT6HXUZBinEt7TI+6IY/MK1cda7L5Wjlqi9Sj0pQbysRxkPAYpiFhnkbj
         LtR4djMvHLlfjRcixa0HFZTZ4vhmD6xfjYc4o9KUKvtSmmKsIT/kq0sGqMUkGJOVny+a
         t3P7ge0ZYuXojHjbzNh0zNaSIM27yRlny0LXDwA5k0m0By/Bue+zb4iuotgIWCl1bcnE
         ePlKDXT/ZLdMwOVJg0cb8XvVC4rySGBiSr9bx54c296q8oJsEUiwjTGud+uZjBPKSNcF
         G5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=;
        fh=OlVH7IRaOTyHKu1yMp+tNd8FfUngl2E+Y8ydO+fJjJg=;
        b=hrg+Wkyb3As7d3OB2a0bMyXUzzg5Mg0CoT94SRHBiD3vNh+n8mByq45uAoplzHCSt6
         EQ4T1yfod4JSGaTONExBTDHwUby9Ce/LqIcNzBX+YaBnu6LDF+eggAYNqwV3OeMYugJT
         ZVAZ+1gPjF7DHf9O8S+5vm9r6M2zymkekknY6en8e8OZXJuCKt9J0utyZNEAVVT2p74v
         G4KsLOoQkBZBGVyvHrpRtY9loW/Gd0NqBoYhFB6kS3oFHeWAxD0VgWviM7qlBHaLlKlU
         Ui+qN82fAL7KR89iFhpZdX91yAxR1wPffDcQyp1/k7u8C/P3/R0vmX8xODNmOSiXSlEk
         vmWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769529325; x=1770134125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=;
        b=cE3dOsbIcFUpRc95Rrkfl0bgcoGDZj/8Ai3+dCg/Vv2Tfz7gK2KFwwcJbXZDzWzdJt
         GHBIflOmi2MWYaaf4qWPtzsVO4cbnxSFu3LtZC5ERVKpxZjXdysS3tgYZqwrq1VGUfhl
         /hBcu2SOBRQ3ugCKLNfhpfy6r6ZpQ+b5HzIsoXJrn6cpyZuP9W+4L1MpkrAoKLBl+IQJ
         iauuAm4rADa2Cf+eiAN17hrMutuhPwO0sbTeL0QQrXM5X625ZHXkAUFqMLrBkllVSVKh
         zPiFA6JbV8G2EHojKTyuUa78wJnKW2xtsO2DbugYsqRC08ty63E02psep9/Ds/nvasw1
         RkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529325; x=1770134125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=;
        b=KIb+QQY8CljaMtv4xH+3YxTEQ+68O2U5vJQzyMY+mXrOK0xSyymY0V0eza8Qjj1jYk
         FXEL3YngIec7xoYGBW4gsXeVSlhT5qpr5H0UMKmV2C/Flfr4klQUTmXjcFxuwKlfX+By
         TR5cwIB7UMJ2v202JqnzD/rb627VdUBKbuoBCSGhh6ins8tFMw9fzxA7c8idOwYQwiRu
         /gh6chwhMsDcmqK9NcYXGPtpsXKvhmndc8qwKPHinzYJIaTVVrT1iEDL4LUdsnuYuQ0c
         cpQlDOSukYIAywawsbH4RVO0Xf1MnsQgkIZkajrJ3vR2AUnHxgjTpRx5Y7EDcmLlORGQ
         jD1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUY1f2WVuSyPuaLeSJSc798Lr6vMPFyDoGbuonwcF1B0UuFmCNCW79RGIf20Nu7nqELNb2SFt6rgBJkPT8nmb4ZCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUOHctzDQN/nvZnXPDMBAC/8Ru4M/Y6NVHfSWcUnfvwlS6r+kE
	Gyuxy5EZ7X4qikb7tdvihR8K+i5axK0gShi+wNMuSexw5/GnCVSBmZU6Z0+9pBrPy6m+FKmV383
	Zi0v6QX4+l4Onf49Ff/f4fjn26/cqzz0=
X-Gm-Gg: AZuq6aIpHQI5Gzy3QtWa0jdhhfSuQeWdv1xGIvVcj1Qp8CuITBhcWlOTrGkE37brusn
	2zGX6tVvK9u6v/EpPd52IEZ2h0qt3ZQhzsDAiJdgo+pjMJ+wQePhszLk1e5QXL9HNQG+wlwNLR6
	2Z2CjDfZ38d4eC1NH2FZPdCio9SVKfkxYRwdvG3PRaSj4yBx4lJe4gZHH0hDSnc3Gvkasd5qFhZ
	oaNM6pPSAd4ML9uoyqwYCn7c5eI0KDhpDIb7fiLzgH3n6KPN6QdRn1nybwxYSTfWOWv6HhdHMZU
	Ib50YCFYsnemEc67UC6UmNqoyND8zItklBZ42P15lUZsDgURW6MCGbwfFA==
X-Received: by 2002:a05:6000:186e:b0:42b:55a1:2158 with SMTP id
 ffacd0b85a97d-435dd0304a0mr3286115f8f.17.1769529324882; Tue, 27 Jan 2026
 07:55:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk> <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
 <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
In-Reply-To: <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Jan 2026 15:54:57 +0000
X-Gm-Features: AZwV_QiFFOxc86MsSOA1lIfzqIqjtoa3ZePZV2eq56xOKDzBCZT0iVVI9LGkicc
Message-ID: <CA+V-a8sQTRZOFk=KASum4Gi4cKK7NdLZu1W0n4ZyWPuKGSc9uQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC address
 across unconditional reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27487-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[armlinux.org.uk:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[armlinux.org.uk,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,pengutronix.de,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 9CEE397519
X-Rspamd-Action: no action

Hi Geert,

On Tue, Jan 27, 2026 at 1:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 27 Jan 2026 at 14:39, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Jan 26, 2026 at 6:11=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Mon, Jan 26, 2026 at 05:25:03PM +0000, Prabhakar wrote:
> > > where "local-mac-address" states the MAC address to be used for eth0,
> > > as specified by the boot loader.
> > >
> > Thanks for the pointer, I will use the above-mentioned method with
> > which we won't be needing this patch on the RZ/T2H platform.
>
> This should already work out-of-the-box, as
> arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi already has:
>
>     aliases {
>             ethernet3 =3D &gmac1;
>             ethernet2 =3D &gmac2;
>
> So just make sure to set the "eth2addr" and "eth3addr" environment
> variables in U-Boot.
>
Agreed, it was just that the aliases in Linux and u-boot didn't match
up (Ive notified the BSP team to update it accordingly).

Cheers,
Prabhakar

