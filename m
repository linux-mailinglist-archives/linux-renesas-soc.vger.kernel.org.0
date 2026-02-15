Return-Path: <linux-renesas-soc+bounces-28207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iID8DoZtkWlkigEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 07:53:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516D13E279
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 07:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C5183002F7C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 06:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D058288CA6;
	Sun, 15 Feb 2026 06:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izS6GASo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C86279DCE
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Feb 2026 06:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771138432; cv=pass; b=ucAIti1ZMZBEH/VpaOOsgNXfK9A57pm+x0LhPOYpY+jlDIYpgbnPVcBWwJSQTWLEH2bGbzv1UqY4STR3gJxrj5VfAt1Qa6TW4yeIZSlsOAsf8/w8pe3o7ZDmCFLSBvRAtdV4B+LkzCJ1PCJhOhVthTXsF8EoNVleu0ohOITPOj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771138432; c=relaxed/simple;
	bh=fm7OyMKRSbRkqMu+SlOlybvCFrAlEJBRCeRwqVomiXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTlT1jwMNCKqor0IV62i4u0ekBsU2Os56OwvUnhPsZasUL28U6mmBrUXgvXXrk/DVAn9jzKSGbS2tDsic0NMClovdW/P/XHLts241xzbYL1eQveSr/G6otRAov0Bdv0ENPznU2r85XvWdix7RVF4Bo24A3SEw6p2Y0O9WLC5gDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izS6GASo; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f8f2106f1so285224566b.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Feb 2026 22:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771138430; cv=none;
        d=google.com; s=arc-20240605;
        b=QMjDKztBI9XJS0ZBajZrxst4W6cor7ZcijYcgwFkh9ZNsoRTjbASGHVBZj1RlTjPjH
         9IBfNsvAk1K/NyqrZbs/2ESkTqfph60KVSHYPq6PWV3d8woWTRAWa4USOoq2o0kcWDlQ
         6l8nvwivHC/1v61oQTOOIXgrq23DuWqpMx1BGZbOdhnoZwCymnw2+NzlOpdZlv8VSN8w
         F4ugOGLPaWlGnP6TovsztZyXxLSrK9YZ3X1wchtSxc7k+6/XMqDDsyoR38CQ7lPzSocQ
         Jkm+duiQkENEyY3ZPc+db33iD7yMnL2Qn0M0Le1LrnvkAjVoqhxINGQU+kvOuTJLivos
         YoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fm7OyMKRSbRkqMu+SlOlybvCFrAlEJBRCeRwqVomiXI=;
        fh=6SB3an4tQ6v2PMhaK/2MutF/S090D5/Kyd2DxiXJRMM=;
        b=CI2HR0Bv2PaYtlnMGxDfGaRXl6EuF4FILgolpmLAMcmRyKlvxY5CTsgEiMRifMzVmw
         QrcRt+XP78XFVHqN/cmURbWuQjLLwpvXHaqdIOxLftGbPV+ivKtwFpC6UjAtsL3dXoQW
         LJ3VUCfKk8LxF4PlvhJdIO9giD985bODK4WO1En37Zo76xrpe202ZWwH/qsLFOhZF0Jl
         +c68h41Lz8LjEfeMgzi3V+1eV6LID/5GNVGvrBdmz/KviUzck2bVMb1M1nQYnzq6WseK
         R7k+VAkDsAG4eM8WjeoYxUQRWcS8Lm3SSAH71OTRnG2gEtYmfVd2FwaKEKqOuZyySZW1
         PRFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771138430; x=1771743230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fm7OyMKRSbRkqMu+SlOlybvCFrAlEJBRCeRwqVomiXI=;
        b=izS6GASoBVX68fi7RX/rPsmThHO2AX3uHnO7Cpk0t7IKxX5bci/jKUoSlsuH2SuhPk
         M6WhJxvn+UvpCzm+OZk4InM+Vc/kk7HgUEdVaesuFAkrkvY8Us0g1FoWvbDMkKJUmB2L
         3i01kbNXmIHPLro7pCiLrnByHYKguQzxuNpkbe5+4ZeCMIUJfYuhYO05+fCBBOAF1Qxa
         isFotsoKlVc+WPReOKdEtxWBYS3c/um7RWKO+hjCIwBCKPSEH2h9YRCuXC76td6cw1dr
         emcxbKlqbg/XxX152B8vzAjLArnswC4LQTA3Ysp+UXjGVC0apm47WGZYytbOuKIeYKlt
         kNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771138430; x=1771743230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm7OyMKRSbRkqMu+SlOlybvCFrAlEJBRCeRwqVomiXI=;
        b=dDZw/Dk7HAFLCx65z1+j1FsvkCtf99WZc9yxbZ+n+crZHtqmm8WaM/oowI7pDpduEE
         sDsr3oP62m5QSS6U0zfLVxQ0FwnUyMkl7Eut8yjZkExeHNh+8v/tPWL0n3yCGDLz1ExH
         21sYozwaUvAQmG2C7QibcoDlAIJ+hegE8S88aom+HBPay+o2VxfJRuJ7P1pPFr/AtFOz
         q2AdkyverjNzDcDVmqXpAiZzhbHCRjA/R/oKpidzIHPB4sMah9CukLYlX2FiqQdJc/uM
         m34w58PmPFinrz0u3u6XKW1fvgsBhkBdTp3Dbofz6ATWkmZyn1+msCyRXxatbgbtMbRK
         kC4w==
X-Forwarded-Encrypted: i=1; AJvYcCX1aYTjA+DsdIGMDBxJrGwwCVgXEgTwwPD6CLq+DytOPIMpYdTDLKBlUy/eEelbvfi6h+i9+LU5CuWfzpNQDro5rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjUlGHiCsmbP0KmWyRUPhGt3W9GLwYxe4xLdLKD+aMhjAB4kkJ
	5KdPGrWNpJ2tMrKkznvi9+TuymsQrILf9gdaarxRdtQan7UQPaEOIRI53EMzhcLcmTbTZCifvs8
	ZBGKjdgMs0UvBKJBZjZTUJ2O28QjkJfk=
X-Gm-Gg: AZuq6aJGMLRB6mqDRQbshbbXsVNn0UWryaGhnH/qcDDEV1cesNz9NReYNd4jKl03f7a
	0k3qvg+M/F/FYz3EnUkQ20xEyt45RJu1uRoYmLEvW6bV6/Rf1J//hCwmycNQA5BBTCKGJUpQuD1
	vfpzwAExi9RRXUKc7cblJmOxWypzrr4FRDUPbSUaSZuymrjkdykJTf6qhG53wHxKFXsilWJmjAd
	G62h4b5GZUlp3rirGlPhzJ1Hl5xphhquf6l83YkZSqr3hAxGlYM2t/O3chRbcIjYLcg08r/OlSQ
	EAF30NU=
X-Received: by 2002:a17:907:d0e:b0:b8a:f9d7:1aec with SMTP id
 a640c23a62f3a-b8fc38f9100mr241469766b.10.1771138429366; Sat, 14 Feb 2026
 22:53:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124163611.3279104-1-onlywig@gmail.com> <CAPStFe4qiEhmF_zDynuWE68LGtAsKsjg_mQHY1zdBsoMsHru3w@mail.gmail.com>
In-Reply-To: <CAPStFe4qiEhmF_zDynuWE68LGtAsKsjg_mQHY1zdBsoMsHru3w@mail.gmail.com>
From: Wig Cheng <onlywig@gmail.com>
Date: Sun, 15 Feb 2026 14:53:36 +0800
X-Gm-Features: AaiRm531Ead2P1abmmNlJDfTGkABx5t6UtzMpzXenz8InTeCNWJcFNf_5jR9URQ
Message-ID: <CAPStFe49H5x7S6JPV5D2MtH2_R3oxxRy+tScEJpQC_wBSNTB2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add pixpaper display overlay for
 RZ/V2H Kakip board
To: geert+renesas@glider.be, magnus.damm@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-28207-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[onlywig@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4516D13E279
X-Rspamd-Action: no action

> >
> > Add device tree overlay to support the MayQueen PixPaper e-paper display
> > on the Renesas RZ/V2H EVK (KAKIP board). The display is connected via
> > SPI0 interface and uses GPIO pins for reset, busy, and DC control.
> >

Hi Geert, Magnus,

Gentle ping on this patch. Note that the pixpaper driver and
dt-bindings "mayqueen,pixpaper" were merged into drm-misc-next for
v6.18 in September 2025, so the prerequisite is now in mainline.
Happy to make any changes if needed.

Thanks,

Wig

