Return-Path: <linux-renesas-soc+bounces-29953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO50FuZpvGlQyQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 22:25:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E92D2A5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 22:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 642843014F44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 21:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06098402BA6;
	Thu, 19 Mar 2026 21:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wq9falUI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17BF38F238
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955551; cv=pass; b=tZMAhXwXgXBW7+pnpZixpCmJED2ucWfSNILbuW5Dz9WC237tsn8ro5iIICFW+il0dNITNElsZ10dDVCjBBdEjEa+nh8p8Yz/t99B83SaLybqrnAeq/qS2JXC4ImhWevqhMklwffkucRsqLp9VV9u41KOhbz3MD/1DnbFluzQ0io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955551; c=relaxed/simple;
	bh=0xmPzjQJZlQdvWU93j2fpUbP2wdKZDeT3xI2xGj40f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nygn1eHvdsXhbRUcSPbNHOXaf/4br6BlsaY1+T6+2/LiO+EOxU+KeMIbQHatPfiORljlQ5cJj6zKe/mlXx+rb68GE7FRvOjr7+vvr3mly1Lw0aIBSp9E8NFQM2cnSQKtV/6h4k/0tPnndlWlamwmSXlMJXimIryV3FsChZ5sKM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wq9falUI; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so1003909f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 14:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773955548; cv=none;
        d=google.com; s=arc-20240605;
        b=gvbhWKyFCJJvDYLyQTZtUcyM507O13UvoXypVcpqCc0QYkClgzaGNP/nSQ1irb3EJG
         PiN2nLlPq8jFOHYScr/PV4GX+0P1YjkYe99JLnufyxjRdSRybYW+2T1tP+0Sc1wT8Zcf
         t6kbx7gfx4Y/w/CU1gQu8ivZp43H1YsbqTrLu/RTByfJV2hm5UHf+CIZTDyjANYtG/qY
         NYnOdbOEXjrKg96Njubzs1prIIx55Z7yk7RJ69IohF8J84HLYqpkNLRyJwD05butbaU/
         Pgzufd6SACQyIBAOptw52vKgHDOZMdfjXKCYEBwzu4UlFKXYIf1TkBK/s83xKVraMH/K
         Y0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11+5iQhuoi7uXTy7W6XUR1mpsLG8FBwfMw3VmGaz2Nc=;
        fh=sOgHX4qg5UrX/Su9ReJrTxDM5xoSri7O4tYaxHv2+q0=;
        b=kYchktCe65IQA0IBdy/DFP1HoPj40ytyPd+C4oiGZvMRCuSWyDQiD1oe9lHrV2Zv8G
         KWY/g2tu4q6obc6al+7rnmFcfzfa99KHvcY3J26wjTrARwIMbcMOlO8aBpFeXwMEtBgg
         zIygk6lOCxR4Voj56833vq6MSrc8SEuKkA070hZmFsH1ZRwmMSmDr8n1uAt4Xr7sj+Ja
         y2ZWn/zypm9dJAvnQFeHqidw52XEvTDArWaaF9Zj/0PMJs7GPBdD9InMwW39C77R4ygW
         gc5vmThkP8kYulflgYXcCwZsg9tDI6F7OIZTQ7nif1UVEN5pFcj85yRAV6gHwT+8RrKA
         O8Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773955548; x=1774560348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11+5iQhuoi7uXTy7W6XUR1mpsLG8FBwfMw3VmGaz2Nc=;
        b=Wq9falUIevYVel+9X4YXlIUkivwkt7ibVUlP1G6Z4Y9YYevRjQKuggc83KoNeR2e/L
         4MD1xRVBwRnszzyvULbTOsUlULa1yqA8khDsuSN5EaizcXnbLc0KTBCQ0gDh0YVVvE27
         pk+4ceTqMioTv2trH6nP9QpTz5uPuWIa+bJSjsfaUNX388Ael18mXHKAn1p58Utv8esw
         X7CgolWRyfoOKHtobnPWXhd8YQQMfiV87oN2Ftq2VoZzyvWeimK4JgL7ud3LnwefNcQv
         laiZDYfFkEXlTZ0G4wIxerRmnFyn62/3RacrD5NQ8micJJEdf+mcEcvsDgQR7G3nHL2i
         wi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773955548; x=1774560348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11+5iQhuoi7uXTy7W6XUR1mpsLG8FBwfMw3VmGaz2Nc=;
        b=jipCCVdc9/P2IQS5lxR1e1/0FqBtK2oeD3rE24eWAaOMGXsPQAunRL9fmKJZAzS5Ue
         Yt/Uvd+ltzM9K6knS/BRyb+u4sVwxmTOp56m0m1qwWQFqHj3VbUUwB9hmJd6LZUKoNL8
         53rLLOtnVD9GzE+4YocpSKfKXjz6UuNHoF/Tu/qb/l2VvMNIJIcvRUz7KzcG2ZRlo5U4
         2OiJ2X7ttiPw5Dl2RsPfC2vN7fZc63opf5H6nMDYS3PgZCEcZfb1oz+cisey196Z3QUR
         dOtJd1XUyBYaKjg/9ymP/L4leVAJ/elxtE2sL0fORMQS8sbP54KrOejI/0Ftcq8nyi5c
         tiNg==
X-Forwarded-Encrypted: i=1; AJvYcCXwgCy8KNBfuE4WqwNwlnB5DbgNxLAMKnzBLW6VokJjIcujEkhnerRuMRWL3P7wRpNcOO+MfzggHt94uG3luFbndA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAg5WadHPwbsFBcELmU1qhQf8LNbf6fYTTyYamwm2LUfVhyYI8
	HgBLamhXsfGlzpmHMCLhMRPJUUokZmbSBvmaafflj4hjxepkAhCTc6dBIHVxE81/pHs54jwOjpm
	mRab9A3ee9jJQm+bdgmml2vnMdIo62tY=
X-Gm-Gg: ATEYQzyGZCFwL7l+cladF3R3PyHXRyuzVWWHj1kVZ/BX3bhTVZJO+TiPETaLZA+ESwm
	bkxgVr7PrFr/wDEdplexqykKApKvbbXQbQvyzAivNJYqTxC60qxaypnJTuNfT2lvsapwfUTTiQ6
	Y6twWIWXZ3a/9UzrWGKxB/Ze/N9aafso+o3gM613sEqAeMixxUgKfpTk6boSn27f/4mFxj8sf4J
	UqGhmp9C4qmp+XzTeLK1xFoYtZ4IuEtPGPMT+SF6f5HwcV99CLXr03bIKqpaUKzSN6vk++fDWOk
	KKRDTtob/w4GbeyuTUYnNLzechUuC2lkU9TY6sCgzQrD5+S6PRmta9pfhOqBuSJqxferMw==
X-Received: by 2002:a5d:5f86:0:b0:43b:4921:8743 with SMTP id
 ffacd0b85a97d-43b6428168dmr1457840f8f.42.1773955548067; Thu, 19 Mar 2026
 14:25:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319-outstanding-rustling-galago-79bbce@quoll>
In-Reply-To: <20260319-outstanding-rustling-galago-79bbce@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Mar 2026 21:25:22 +0000
X-Gm-Features: AaiRm53jXekaVqxmChJ3S736fj6vkeVSf_bLa2tMBc3wXcwUkkgJMeStMSMAbkk
Message-ID: <CA+V-a8ukASOXD+2Bdy8HNpZmTARgVEaf_+WM-sjn1jG-AFr20A@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: pci: renesas,r9a08g045-pcie: Add
 RZ/V2H(P) support
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29953-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.667];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 629E92D2A5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Thu, Mar 19, 2026 at 9:34=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Mar 18, 2026 at 12:44:47PM +0000, Prabhakar wrote:
> >      then:
> >        properties:
> >          interrupts:
> > @@ -236,6 +239,21 @@ allOf:
> >          reset-names:
> >            maxItems: 1
> >
>
> I do not have above hunk in next from 16th March. Nothing about
> dependencies in cover letter or changelog. What am I missing?
>
My bad, this applies on top of next-20260317.

Cheers,
Prabhakar

