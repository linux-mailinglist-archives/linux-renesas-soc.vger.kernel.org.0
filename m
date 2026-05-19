Return-Path: <linux-renesas-soc+bounces-32790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA42K+4lDGoIXQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:57:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA057AA61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3583E3106E97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 08:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B75C3E0C6B;
	Tue, 19 May 2026 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKyM1b09"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666623EE1F2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180537; cv=pass; b=bEIvH0Ei0LWihydviF9YYjo/RCPElW9ip+yL27n+sHXqXa6KXEwFwjd3TBxsGQFnOH5mTnA2D89Zn3reT9F+t/J2Imh4Wr3Mn+ToXs2GyGL2iCRVj6DKscA6EOvmH2fy5HYyE8o3L0rlB3+dSD/Lxz8ZCaSJaiJu7ap3Jkiq1/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180537; c=relaxed/simple;
	bh=L7Ykj0gPG+lx/mCTPBJckTP58eFqkokUf7j+TA8XaKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfHxlOEG54aVH+FxKrFw5WnqNbrWOnfd5t7IOg1mI4DKslxX3g1pkzqVyGtK5fQjtgjMyFCAbGd2THfcOYlbjOnYPI2kgvQ9PHX2zrbWwsYHF3KVSrstEo7obiKtZ7nvkzGKMkCkdaLOHqB7c9/V7AYZjWyqmOH1nQB0xBxNsK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKyM1b09; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44e5624c053so1908744f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 01:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779180531; cv=none;
        d=google.com; s=arc-20240605;
        b=MNACRfTkvNx+sIZv2k9nkQ/3XceCxOQi5N18k3Zx+FfqB3no62bLZlHAe0wZpAu8dC
         0A/+RRR5VAKwTaYO0K3Wj//6o6KQbwbfKvCWYjITZxojGmxCZmMhf/3pZEei7eMDrx1i
         sjsgrvzKKRPidWLF+psbB9TYtZsHC7LzzoGJKUACpTnttZJgBAMOpKYSQx3KwCF8Q9Zg
         wiciLe3TOQfr72PF0+mGnB9byWVecw455tmipVXv+0H8QkhyLOzPtoviXtH88EQYbiKF
         mNjg2WtNnZuJBXEqEtZu2CqR2naV98s7r8ba5HyIjdS+r6rP9nC1rkxrQMi/GINKzQO5
         1q4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qAs7C/WzX0A6CgWn6eUlpt9XmIjo253l0QhFbeq2p2s=;
        fh=VOtT8lxploZOMIPU6tbRKRWOE9SS14gw5yk8qhOF+F4=;
        b=AOJdksdl8B3pVVjv/I7hP43peOpQD78+lU7K7Wp8P30RSPmy8lwjMJ5NplpR15eTZ4
         eFqCJIbT9oXTDRARVRiK5j2toXLgQ8VVbRhDSgJL++fV5gKyOPV81OxSgcEKfWLV8CmM
         KNQnwrkJsoyj6r+dkUXjaYfN8+iDyYzT6o7sQhFkAGnnCvfD1ARDy5ruJZvnxdNSzPPW
         IgR/JOf3fRuAl86TnibzDTywuMSr/+htpTsV5Nni63cCyTr3AO84lVcI52gyFg0Jhm1r
         mVHlIaxfH+2LWTzftzUCiBptuIP/EDllvavUTXJiRGvry4Xu1rWo2yo7V4AEpTZJcOJD
         Tjmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779180531; x=1779785331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAs7C/WzX0A6CgWn6eUlpt9XmIjo253l0QhFbeq2p2s=;
        b=LKyM1b09fGCUnNA/40fBQvHxhGDM9OHNNKinU0EJwurAdDz8+pUGCOTMr8Rk7iGMOn
         oL+/1iz1OsLaMGuPPiO9eK9RBv4O94K5ZQpaPTKp6sybDofuOIrepCSlQ3JO/bOPt3tP
         ICeWkTFUbGb0dQ7gpYukkcHx+M3VE3QoIbcYKLp7oWNXDUJGMG0fEe9B/zgyULBSP++w
         Gz+nY5dcPE5V/UKlcJlR2fiRpXqSqbEqOexhtrUS5hfhOWTz6KojUpZuYcVsWAqnHXbv
         TnpSefXOf0/7HeDvaQYrcWJWM+3O1hh/1vz64gmW6IzWNak9gJIXnKwbsf8Jl2kBcCyn
         AAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180531; x=1779785331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qAs7C/WzX0A6CgWn6eUlpt9XmIjo253l0QhFbeq2p2s=;
        b=L1VtvpP+fdzB9qjf4o/NX93zpwKAH9aMGbfJkQ2wKIv+UhK8Q8Ny50JN8rmYTG4aHQ
         wwOviOE+SUC5XLenh62SrMFJgAPUpCGQLuqD9gv9ojq0pfU1pDLWkD+OhZJFVCmRyaC5
         8NkEx23cQz+0BOW+fr3JDWxSJwpR8Utjlr6V3/nq7T5QwYOZbB+W581orpzdyo8ykaWN
         2R6xq9flGOomdSrVkbshLMmDX5OIVpRVnexqR8mlyu/zdh5WvGOyOMj6czAYpQwXrcEU
         HaXWiQSj5fl3O2JPY/J6LHzBm5QKC8eJzU6OrUTNP2550dZDwrCYX4KLOehWsLFSwUR3
         GnNw==
X-Forwarded-Encrypted: i=1; AFNElJ/t3J3Wocb+NDvN7w0H7Ln/8dsNTRDdH4AGAYqrM7+9Nk1QYisXq/UNhHI126SG8aMvf5BC57TaEobYv2A7h/KCpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys9LAGlxSNuZrSzmgZpGHzZA6B+j9205Qp2pPwZEhrYoVkY81y
	yr3z6EWfvGIjh/PwYehb0axjIPlaZGzkHyPVxe8oYaomgGKJ4Tn3laJMKpe+SrUz6OFWx2OMnyx
	lcLOpyI9e9S8fLd28DNf5rJ11X2mBbbI=
X-Gm-Gg: Acq92OFqy8O9hoWvwmDm/sKh3hJTnC156ujpGRiMEwIAyUnkhClOwctbWnJCio86XIT
	Z1M5H4iwcZh0NJGs+DKgpRP9TwzoJN4BZkaEVZnWTqC2OjtkMWG+zqZ/nctNH052PU1vIBOWkeQ
	qF4EKISY8bYZiz1+G+xzBn2TihbcQKngFIZrmcduPRl02Lhjk/y8JNQe/YcDASQREzdRcM1AQav
	w32l/5+tnleOpGgiEDY2RtrC0R6ZUUHksAUmzGilWATiy5h/4CgG0d4XVsohlHEDqNZURd/X7CE
	ZnFp36hauYdlDet6NaOIwXibkcWDW+6Wjp/vmPJ8NRJPvvnjw8P2XcI+8qXNbN/RPYT6
X-Received: by 2002:a05:6000:26c4:b0:43e:a69b:d810 with SMTP id
 ffacd0b85a97d-45e5c5e6096mr30919439f8f.38.1779180530885; Tue, 19 May 2026
 01:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428093146.3171672-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260428093146.3171672-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 May 2026 09:48:23 +0100
X-Gm-Features: AVHnY4JDSDZKhMN8mnbfN_GTC32D7XCGPxSQ9eBFs6CYmaa2LvQkl4atf8UJel4
Message-ID: <CA+V-a8sthS1kEKWuLmBH9SwGCutAVfhvmxwAjEbp=TCFiKY=oQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Fix clk_divider_bestdiv() to get max clk rate
 supported and add KUnit test suites
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32790-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 2ADA057AA61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Apr 28, 2026 at 10:31=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This patch series includes two patches. The first patch fixes the
> clk_divider_bestdiv() function in clk-divider driver to return the
> maximum clock rate supported by the divider when the requested rate
> is larger than the parent clock rate. The second patch adds some
> kunit test suites for clk-divider driver to verify the fix.
>
> v4->v5:
> - Made use of KUNIT_DEFINE_ACTION_WRAPPER().
> - Added RB tag for patch#1
>
> v3->v4:
> - Dropped unregister_fixed_rate/unregister_divider/unregister_mux wrapper
> - Added entry in .kunitconfig file
> - Fixed reverse christmas tree order in
>   clk_divider_bestdiv_ulong_max_returns_max_rate
> - Updated MODULE_DESCRIPTION() to be more specific
>
> v2->v3:
> - Added Rb tag
> - Swapped the order of the patches
> - Added the expected value in the fixup patch
>
> v1->v2:
> - Updated the patch#1 fixing review comments from Sashiko
> - Added a new patch#2 to add some kunit test suites for clk-divider drive=
r
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (2):
>   clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX
>     handling
>   clk: divider: Fix clk_divider_bestdiv() returning min rate for large
>     rate requests
>
>  drivers/clk/.kunitconfig       |   1 +
>  drivers/clk/Kconfig            |   8 ++
>  drivers/clk/Makefile           |   1 +
>  drivers/clk/clk-divider.c      |  25 ++++--
>  drivers/clk/clk-divider_test.c | 153 +++++++++++++++++++++++++++++++++
>  5 files changed, 180 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/clk/clk-divider_test.c
>
Gentle ping.

Cheers,
Prabhakar

