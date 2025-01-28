Return-Path: <linux-renesas-soc+bounces-12671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C30A20C5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D752F3A3140
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3877E19AD48;
	Tue, 28 Jan 2025 14:54:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C153F9F8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076066; cv=none; b=uxJKcC+9n/lkUJotERBIkAZIsxFG3SEbeFITNCQG5DXKQ5QcP/bimXyv2m4BF4nLP2oZ4Um5cR2byyuVmgWl40NpwPZcngQEZA4jizDHyoBXgIno1sjkHNVijwqKeKPszzwBVQMBK8Dq8KJ8E+gomy30rcksaMgt1u7Ho2KURnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076066; c=relaxed/simple;
	bh=I/YAMYSNrPwpATf1J0ACiGAG1gCqH4lupsE1YIekA+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pquTh4VZD4+zaKIHnfENHJhlFCPMGcBMvuV2Fe0CkA0vVEvRjkkv+/jKuCp+ip3tjboEKHkdPrEGk/lgE3zjcnbiIy2kGafi2PpbJPqZ1mKe2+1p8ouoip+Q0Ed5EvAkTrBUp97x3qBj4424q2ifepCKm3cPlxKgQi5CZNaAdB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afdd15db60so1621166137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 06:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738076062; x=1738680862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGwOg4zKSih/G3XlHnkBYIszNVH68pqi9LjNFY/KddI=;
        b=hTO+zCv42bXrztiTUFWLl8vpuvHLBAzxl9DQkxTveJqTN13MStPm6KHnCvVy1vv5Ag
         xI8jn1aJNISTKPk28FhAfzBixkVpJF/pUOeEhGvbpJmBjJRfD5O0Nl33jL3/Oyk30hTU
         jBvQOkky9WnL48ghClYX/eBhA7BclEmtb5H9llQEUzXdlvo01ikjbyHfbx7XmQt1WVeo
         wcaDvVRJ8Gr1TxnsJbOUir9TIwx9MSTsE50wzb1q2Pbm2Bpvk25k2GMDcaaPE7DCyfI+
         NeSTox7SWJr0EgetprA56RjSJ6kYHq+29goVr5HUvoJz1EL69NrlOiHGkjEvOyTpKsXa
         kAdw==
X-Forwarded-Encrypted: i=1; AJvYcCXSwpJBc5qi2dr7n/oXQTzWXgYc+a48HY6hLuTzK8xI4jSnkxSmlBZ5Ka/wd69r5oQPF+lkmchNlKWMgZsKnsjYyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ5/+zr/Wz/mLbGHTg3+A1U02XIjAUJfJ7ErJ6T8CUQvIGFlCt
	LhMTx9C5ApTb4cFrq5hIlbQpnHcmhHhNxhHKun4luyLDmYLiOsfwZyDcyyFS
X-Gm-Gg: ASbGncvD2KyCVel/XAQs3V0ceeCP3QAzZXNQSvjnSj268t/frD6FYe53PmcZOngRgHW
	PBcUbpkLWJ84tqrO5sohnfDO6oAUUxBQzHsgZshbT4iN1DsXI1bOWBkJ4uVZzuBJtCnVTZtc6JK
	qBpajARrB4THkDW80R010h2N5ZXK3TFO3cQVB+NUcs8wwc1aSBPMAM7vGEkaS9iiT1IWiB/sMe1
	AZIQ6NMWPnoqEh54/++q0IARM8MAG+NOinJ9C4VZomF7nKnn8RbEJ56IbWdMQMQJDr3ZWL16z0p
	GHPBN56x85vZkoB0rpClsIS9cWO3wY1S/xQG+fFD1rC0sPJRTWfgbtNLRw==
X-Google-Smtp-Source: AGHT+IHlApowsq3Am5qLdFukh19IP1Aw6ImmLMyQpxGwrc/SmL112gPGGA3yugsZmLVTMyzK7qvtHA==
X-Received: by 2002:a05:6102:f0d:b0:4b4:e5c6:4c66 with SMTP id ada2fe7eead31-4b690bb56c4mr36835595137.6.1738076062598;
        Tue, 28 Jan 2025 06:54:22 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b70999cefasm2163389137.27.2025.01.28.06.54.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:54:22 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51c7b5f3b8bso1825030e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 06:54:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7XrBJFyaC4GT/mLnBriTBI5cw8OTueKDMoCc54KPmT7xLbVx65dYgmwa53xG0ZM3/X7fXmI4VPa51S7qUqhLmuw==@vger.kernel.org
X-Received: by 2002:a05:6122:3198:b0:518:791a:3462 with SMTP id
 71dfb90a1353d-51d5b36c2c2mr39830067e0c.9.1738076062258; Tue, 28 Jan 2025
 06:54:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 15:54:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqyhbogm2bg1cf6HxaxYOu_T-Sq_T_DU-m-5n5FpdcJw@mail.gmail.com>
X-Gm-Features: AWEUYZkP03Y6ESUwBnDQeKMM49sLWLv6ANkK4v7Eh7DeOuGKA-URXH2r_yI0Akg
Message-ID: <CAMuHMdVqyhbogm2bg1cf6HxaxYOu_T-Sq_T_DU-m-5n5FpdcJw@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 11:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Use devm_add_action_or_reset() for calling put_device in error path
> of rzv2h_icu_init() to simplify the code by using recently added devm_*
> helpers.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

