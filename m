Return-Path: <linux-renesas-soc+bounces-31338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uICQBABF4WlErAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 22:22:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F134541494C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 22:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E2D0305075D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 20:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6930F3E51DB;
	Thu, 16 Apr 2026 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQmVd4F5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r/dEdhyx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308493EBF13
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370884; cv=none; b=h+1uQGEJUtzZkCgNfd439hG/cGdFnpJikS0KPeiaHK+X20zr8c+d7POPEjwbhbOxZ2xMr9pE3RnO/EKWlyLmYGkPygqg23yHxNVJkpxlKOATIKQGJ0C3GVpNlDPYMiiFxnHEvFlvps2Mv4vUKTxTWEwil0ewIKRX0L3zKGn0qxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370884; c=relaxed/simple;
	bh=ZfvcK1WQYSQJxYFWmliN2X/yjZzr6jKD2FEgu0OfU5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKwEHc2Mlgh/JwSS0S+QiAMzF/12yODmNgk0bNikfcEBgl7cgX4tlPCaVzST5WkBXz2GMYwwK2/YA/vRXUjjG4ciHUvbxRQiQwVLMM77oIH45Me7EtUAmzMuR8k8MsKQbawaIOXdwU9wy+oS6U8dlkgpN14WugDITVhjbfra7Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hQmVd4F5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r/dEdhyx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776370876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QRF8BvcogoOppv5L+uU5WDgQWw4rh47WltzIyMUbMng=;
	b=hQmVd4F5Or2VMN0sIWfBgqftpQNVtLjpsKDBEKvrMU5dP+UAvNLvHEewwPIE7PW72QP0Jy
	j2rijnI5dRL6nM5pMwkLtpZhrgZsUla4+G7o9DhMggi13JHpttEE/Fc7iHaXJAmkevBv+u
	4ErdhHrr0PybjxzRYbMUGkaxI2acFyo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-RiUsvuBDMrSl-miZdheh7Q-1; Thu, 16 Apr 2026 16:21:08 -0400
X-MC-Unique: RiUsvuBDMrSl-miZdheh7Q-1
X-Mimecast-MFC-AGG-ID: RiUsvuBDMrSl-miZdheh7Q_1776370868
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso205796101cf.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 13:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776370868; x=1776975668; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRF8BvcogoOppv5L+uU5WDgQWw4rh47WltzIyMUbMng=;
        b=r/dEdhyx/ltF06DChrUth1eiX15hXppPstSUN8EUgTx1xMWBsqfmBwWhqVqnCH5rfE
         x1fNYyavvNWk0bPCoDsHsuTn9OFBFROZtS9BDEhzLEbC28caEzwVSvhEjswaJ8wpWQ7q
         V5yAW6q2H4nQqETkU9R66SqRW+iARtpWcRk4vv1IenPUnL3TVllUqxPZTUBRy8h7ZVy8
         PTf2rf/0GN0Puoss6XnbwF20ZJvNQDP18pEsWrHKFmPQfJq7+IQUxAWpLkhj1aBBOH2E
         YDVlOg6g1c0NBYdJXS2Ebo0E7hHJ+WIFuZBvoP1gD0AOLd1yIjwU6irvhiYOny49dcJT
         7iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370868; x=1776975668;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QRF8BvcogoOppv5L+uU5WDgQWw4rh47WltzIyMUbMng=;
        b=b0a7mWU+/DzqLzV/cPJtHYU33gRHhnITb5tU2jSbWHUy5IQA7x/m+oYOaLByjLWGqM
         bcZdynvxFKIs47pDaJrYU/GYa+uOQ3Skr7p+EAANFeiMpFWCrhUg8PBDULsagg6jAsGh
         2c2qkTX8KBOqBLciES0zGZ6GvITiTFbIEJRLvl4qFhNA+yrAyPsjbBgOWuaVs719kJJX
         S9bITZf6MKykMy9I5PghtQypQSO0OyU6NpS3TzzMLsGqEXCBtYgkyV1fowDB4aTk9rLG
         rYvJCAVPZzIfZ/7VG7Dp/T2fMWDaYC0+AU3ugb/y+x+nMpJNsgN8hs/nrsHfhZ2h675m
         AwhA==
X-Forwarded-Encrypted: i=1; AFNElJ9G1hna9rEpSCv22yXD4NoAfWKlYj9Rd/n5pAOSd+/2bk/N7b9VFzXXoabasxa9xyxdx7Mg8T8Y45pgOvxN40f0mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPEiyU7NeBI4EufWKE6epNFb45fF6kMAyksi33ofpGUIK423R8
	ljqeR/np5g1FZha+/T9hRfpvPD6fyWlzmQF7o9SAtI7oBo7AH1CumexPeSEPiUcDNvirh5+wusg
	MOeGiNXggBmxoTuxWjUjGw5SInmKNLJduyhsV6yCjigNZV31VfHOw3hJdB/Xz+zt8eZlCK2Xe
X-Gm-Gg: AeBDiesDz265GLW9CWqomxGMO/GNMW3Bq120imCwsSqKZ6v1LaTUNQeleL25T50vtLd
	ThJvRge0TOz6AT2FVYEGN1hVboX5LWNHpPSYBYRtfD2jb2c+wpMbtSqi5fOrvyMSiAltWrrpxSH
	Lyw8ZW4YdfNcw+jih9aU9Z1myGthmxkwZ002zdbGiTRhBVW1cg08Lsk1saJp/aVqddpi2paK4+a
	0+2qtl4EX4vfYf6sGjf3A5q5mLxn3lYhQ/T1eISqPQxgBmmZUO90wKEDIWHyMm1fW9dcFounr2I
	jLmcgc28qmhCYON5Qy4EONe0haAJw74xZtNxysjeS7JhruKWpDS9TZc8sSdRFtvhb0Z0lDtaQD6
	3yzSgg7QiX4iJI76hUwTCsqUk6+GTh0Q=
X-Received: by 2002:a05:622a:aa43:20b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e34a012ebmr7853081cf.42.1776370868313;
        Thu, 16 Apr 2026 13:21:08 -0700 (PDT)
X-Received: by 2002:a05:622a:aa43:20b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e34a012ebmr7852751cf.42.1776370867876;
        Thu, 16 Apr 2026 13:21:07 -0700 (PDT)
Received: from redhat.com ([2600:382:8128:ce33:b0f6:e3dc:ef2e:339b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1ad963ccsm55132891cf.2.2026.04.16.13.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:21:07 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:21:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] clk: divider: Fix clk_divider_bestdiv() returning
 min rate for large rate requests
Message-ID: <aeFEsKQ3sfGLM6jl@redhat.com>
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413124912.3260571-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31338-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F134541494C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 01:49:11PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> clk_divider_bestdiv() clamps maxdiv using:
> 
>     maxdiv = min(ULONG_MAX / rate, maxdiv);
> 
> to avoid overflow in rate * i. However, requests like
> clk_round_rate(clk, ULONG_MAX), which are used to determine the maximum
> supported rate of a clock, result in maxdiv being clamped to 1. If no
> valid divider of 1 exists in the table the loop is never entered and
> bestdiv falls back to the maximum divider with the minimum parent rate,
> causing clk_round_rate(clk, ULONG_MAX) to incorrectly return the minimum
> supported rate instead of the maximum.
> 
> Fix this by removing the pre-loop maxdiv clamping and replacing the
> unprotected rate * i multiplication with check_mul_overflow(). Guard
> the exact-match short-circuit with !overflow to prevent a clamped
> target_parent_rate of ULONG_MAX from falsely matching parent_rate_saved
> and causing premature loop exit. Break out of the loop after evaluating
> the first overflowing divider since clk_hw_round_rate(parent, ULONG_MAX)
> returns a constant for all subsequent iterations, meaning no better
> candidate can be found, and continuing would cause exponential recursive
> calls in chained divider clocks.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


