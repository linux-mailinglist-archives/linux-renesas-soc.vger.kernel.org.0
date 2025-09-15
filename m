Return-Path: <linux-renesas-soc+bounces-21851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A387AB57213
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 09:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B4A3B23FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 07:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BAD2E9EC9;
	Mon, 15 Sep 2025 07:58:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD2E2E3397
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923139; cv=none; b=SegfTuCxNRj8x0SgBCyT+fakVep69aUOWLUB223I/GI0AKI7JwPePw3Hkn8FmbO2pq6r3qruRH3QaNq8xzfqTuDrhmHOMfIl/Nv6mcEbOo63z7L7qMB5v00lBaZoALP6bmbtSbntut6TueZW735vcZVVlf0bKFWV5WiDIX0e8hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923139; c=relaxed/simple;
	bh=Sqn/ZgxgCNgAXSMJCtC7zdfFksm2UGuPqP4avjgv+jE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFNF66TcnpShgQip3fbShbrJ4/d0E25u0WxDzWLmmh6I7sj+VNR2KAyYXg7sb4Hy5pCplQgM8I38lMTJvnE3TQayM2dZ82/rLoJZ6qWRCrCs4ebpdnTINZcxwz/vZEI49e/cm43cODRyzXyVrzv/n4H+z+MWB+XE+yU2HTzevqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5300b29615cso3447613137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 00:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923137; x=1758527937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdEbGsEznj/+fcW4LYAFT5Nf2skbq2ng99E8wh/Fflw=;
        b=wtYCCy/s6kvohGhC5hJ02m6HV+YwJw4MuiOMOjpdW1Zm0hpFjHZ86bHKsKBPhs0Vii
         PCnwXp9Ex4NGn+1QiMWRtXpWQTiCxS1KpgXa3nes3sPp3940Rp0W2gTTLFQ8ZtkIp7/E
         S5y4GU94iOyAACccmWSOgTLSrXa+G5IpUUd6lgfeNKMVCt92k8PvBDshbf7r6pSHe99m
         rASzJPY+1apeC/DQN1BnHVLgCn6oB5jalMF0yeGBVHAjW8h1VKGcauSGRdoueYHxUOWe
         PDim/tx1BSoFKlOlTM7quyrWIayd8tg5csUaJZyZl5C0339SHJGuM++SWa50RXAMOk7c
         eoiw==
X-Forwarded-Encrypted: i=1; AJvYcCXDQjN642j5BEbhjhHIurYBK4ssU4gLvQBO6NVlTExJEQ6CqJTeZ/jM0r1Bzx6ey8Ex1c35W3a3TNyCLUBOyCGtYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu+s5nNCf6h2S4HtqO1czlH5i1sa+6p67r6P3SX/M2Nhhyc0wN
	PFkx6nALsQtyFcjiCkzt8/wL4kLm6khh+1VjlEN9o/6yi+Wr21oHVBA4EkQYIiOw
X-Gm-Gg: ASbGncvXWQ7h5O+IFPcQeODfnPiTulZycbG/NAfHt3L8kPe24/yVxUD1s1StvGL16TO
	Wc9Z1EsJRHDtJ8hXBoDaX7IsW7x9l0z/gBM4WWWoEkO3oGx7QYxBdIqQ7i55GSJWXluJQGLNBBX
	Sdwie1MWVhvvJpYveK7pLTdVFCFSI36dKghB0qathCrq8V9PmW7HRV65GZx+fWQ8DxgHJYdkr+w
	PAIDkgDc4YBS59DdO1N4rKeRsqQ2t0SeG1PzjgP2eklyYhmNX4DToYxhLPnwBgLM8LL4elSMVUI
	o2I/7+T7L1Od2cCQKPAyrx3hSE3XR91MdemzMnkdi4zZGw6PZ8JU42riqFRuOf0y7pGs3MxkyJQ
	e8wdbfQlRQz9xh+0eckl7BIFBMYYHf7JAVrZir6M8552pixS5AdFX39uQ4Sc3
X-Google-Smtp-Source: AGHT+IFgI4B4JooFM+AB3baXC+z1UY7L5IFLP8W0zMHeal+QeC9OrwEz8lx8AVKCaSfZ9IKepKJWOg==
X-Received: by 2002:a05:6102:5986:b0:515:a84d:45a8 with SMTP id ada2fe7eead31-55610114dafmr4357996137.20.1757923136724;
        Mon, 15 Sep 2025 00:58:56 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccc7f6a3ddsm2194148241.1.2025.09.15.00.58.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:58:56 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-53042807be7so2740628137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 00:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXf6mO1ScuReEiwgY4elpMUAlz+HYayk7iRfe72gdn0+id1RM4rDRRRLwsdfXpdassjGGDUvGLnLjDlhYQDcITuXg==@vger.kernel.org
X-Received: by 2002:a05:6102:808f:b0:4fb:ebe1:7db1 with SMTP id
 ada2fe7eead31-5560bb47790mr4450426137.12.1757923135481; Mon, 15 Sep 2025
 00:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912130911.185674-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250912130911.185674-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Sep 2025 09:58:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKu3X1tihsa-ouuoSpOaAhuKB-fOZMo8_CSN4fROeLmw@mail.gmail.com>
X-Gm-Features: AS18NWDKwSEGTsUnPuKBqop6XzqwZT8QTZhdu8_6I5VGZEgrXV10p4SrcksRn8s
Message-ID: <CAMuHMdWKu3X1tihsa-ouuoSpOaAhuKB-fOZMo8_CSN4fROeLmw@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Remove extra semicolon in rcar_gen3_phy_usb2_remove()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Sept 2025 at 15:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Remove an extraneous semicolon after the closing brace of
> rcar_gen3_phy_usb2_remove().
> This has no functional impact, but cleans up the code style.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

