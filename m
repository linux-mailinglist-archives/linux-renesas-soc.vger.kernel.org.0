Return-Path: <linux-renesas-soc+bounces-31685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM65Krq772mLFQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 21:40:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B09FB4796D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 21:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84F1530095C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 19:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961A33DA5D8;
	Mon, 27 Apr 2026 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+1dsbRQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCEF391508
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318835; cv=pass; b=WJ21H/n9Lbkj8dodSaFi0NkndAKSnuV+I/0wUiw0F4ijCllE0JdlkkzjmWuLMMTNvUug+hsh1/rPPwQSc0N3cT8BvTP/+IFJDz4Gice7nagHxZ+gLemtH3rdWFUZzZjnSfQTNlT7x8rTbaBb6N0BWVzCbQWEY5k8X6Kw3TYVD38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318835; c=relaxed/simple;
	bh=ygGcJnN9WVRJNS+yiYYNkS29kIFHkLuMZQJgWl1yhr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEeoC7Zxuf5OToCXBB1LYkFi1wNPIY090PSdpndXFgfV6lJRXktNDS2RIvnOcQgwHUnB8/OIRp/Tn0mzgmzNcM+21M19uQH0Tf2ruGMnaRCBUx3QvB7ci1sHJliai+G3R/SDGHF9ZFst8qOrhjELik2dwfMTYTmni6cVirSiikI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+1dsbRQ; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso98847105e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 12:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777318832; cv=none;
        d=google.com; s=arc-20240605;
        b=O4xPc6D/ob44TuLBwFKqReCdRu4YkGgbtrrTIrtc11usDiGe75cNCoKBW21O5Hvaji
         JKAxs9D5HNFTFNMni72a2WkX0Ab7fptgvLHi61rkFdx36XtPyKQ17jfdlxWzJNQWRUmH
         NA+QXc4f+WUtAlibZ1yF+bYkBsdV/pFx0Sifa9n8T9FYJYSElgSpkoDs5jKaBQRQ9kAC
         xEaW4XE5ZpP2kHOyW3StrXoQ8YaOadiCdvsaRvao/aaIyzOeNaZ4nw1T/ssmAi6NTLle
         95SOVwKPy2e5QO/y1WKTqwk1HDqBHbozWMfIGCd5+XDmiEoE5RFbWeSZ6ID63CykPJyk
         G1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EgCEMaKeQwn6Nx1ZFnoUZ74Xp+Kv4ne+E3wSIOgk/8w=;
        fh=FCQ7+cWZWdcLiHYZ0DLMGgvowTRcpTqyVP2VWGAqfvY=;
        b=j3AipKkmh4JkRBtlJkK7gyRd9vdfIwR2vXhFQcZ9wmr2Ut/emBzTXZvcTGA7zEuUBj
         tkA5k3OttLJtdCTgCcdhlThvoGmpokypYaK7TLFKvAAeL9/Z2o1BK9cLIB2rpKvzRbbd
         P7ByGfkMNczbQZBomBqfB15evirrElcgN3GCj0r5NwLOhN+oDuQ65D8nkxgc7XyhwDl6
         kY0uzalMtlrWJ9AtbYftv0tywwxmL6N2coIzjllBz8m+DuilDKLhYGSCXQyReOOEPPJ5
         1e3bNheWuQFOiggqUmmnbppd69xM/Sl/EDvEzmvMn+Bcd7vSaf5wItKu7ebqXy4pR774
         B+cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777318832; x=1777923632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgCEMaKeQwn6Nx1ZFnoUZ74Xp+Kv4ne+E3wSIOgk/8w=;
        b=O+1dsbRQ12YD/zSe2y8yCzpGSAy4dyualdVBI5qwskrHUxhbLAECiY5l9KUIuZLetG
         S1uLxGj7XPquNSH2Pqfv46wzUr7di3Db2z/AggTX5IUst37hHTJovqyldZRet/Lx9gbl
         asuZFbas8lf+n0jWGexZeQ9YbObJz4isqJPjesWdlYBeV1DQLpYkhPvmocqptifLRcft
         Ga1npEo5I8//ZY/3oaj2wnsM4UCPVDXS1d9jgLRP8UecL7hPbIIvjsDTh+JoCqTmFNU2
         ig64yupI0TmgIZi19ZeAxwI60hoJXAeuil42Z5jYud5xFsDvpvmOcEk1UX6fd8ozmg6g
         BEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777318832; x=1777923632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EgCEMaKeQwn6Nx1ZFnoUZ74Xp+Kv4ne+E3wSIOgk/8w=;
        b=iG/WCqGE4fs1eUOzm8OQBMIRV+td5ggsG1BCfFLHc3/D0GaWhPcI2PAKJBmNTDtmDL
         d0G4wrPZbtVxu5nA4xtwCPnMnpBtFxT3Usd8jdRh1eIOHWVUUHlmERGUzOk8ZSZmdXMX
         FXUbiiXPuSRS/lEp1+pZKkwcpqRsVQXxTfF8LyIbicXwuLEMrGxKTMW3hwbXHYvpXvnK
         xoBzSi6VFpCc4UNqUVN+a7gJkyoDw4FsOwQNcNitCW0NP02uem93k18xiq6rQ3YDsBC3
         FfTzwDaLISzidwMc99+ZD4TPOKRszZYHfjHyGkru421QnaQVlBKdaOyrMLdoQf9FEXB6
         iBXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Me+b+Prd8kDpPQuZjNZM8hcPo9PBTXZ8EQoJMUjTW3nWny76gyEMT5fcvJGNZ4AIvtQVLSJXyrfmIdAlei8MbWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOxcHXsbHqeAXIT9U/DolHv5DNBdL4qlPQCE+b6CV19C3J69Eb
	Kmll+w5qQb8WXREd70rKpNLawxCrd3kpuNoV2cJ1zFHGu1DS7F3F+ApAcV+0Qx/EwPGWXGAbxcB
	7G/08w+jXTqzVwBr+RV/4OPm8Dw/1X4g=
X-Gm-Gg: AeBDievypoXQ6lBEoHM/VQXRiJEXiaK9xasp0iH8PlH6wzV0xIWpOawWdeHSB/xolHQ
	4Jx3iDeTGfxwt3Vz/z+1/sJCjTEehpoW3sxLiA8QPqhnmSR2fKwxRMDH+PdTzEGcdutAwCDQ0sQ
	ZOmQ6a3YZzEFyElfS40aCjsaAMx/KFDnfPZKNSolkxPMxDPb9/VnTI+gw1Tcw8SpAXrR1VIAVqX
	v9KCKIgqqn1d4CG66ZK2ogwStYcgxr//bsvC5I8ZD2EoShTIEdrkQpN7MwbMbD831z1pK0jPmmO
	tJH9dL9hgPszPOFqF92ZqYQfcFdVI4h8cuvLa74VJCNgXGAeuP6s0Gvb309SzgM6z8+SYUc71Wb
	756k=
X-Received: by 2002:a05:600c:a103:b0:48a:761:57fe with SMTP id
 5b1f17b1804b1-48a779b1e37mr1303525e9.0.1777318832222; Mon, 27 Apr 2026
 12:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260427112824.231150-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <ae9_afsqmGDcczhW@redhat.com>
In-Reply-To: <ae9_afsqmGDcczhW@redhat.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Apr 2026 20:40:05 +0100
X-Gm-Features: AVHnY4JzJ2U4LeHB9K-Y3U0QY9v7Tbii2KPRfbKBGk3czlEv-B3AFYoxs0riKi0
Message-ID: <CA+V-a8teW5RghDJYAth0ZPndavt4HbsPA5Z-fzngsdvqbTBHhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: divider: Add KUnit tests for
 clk_divider_bestdiv() ULONG_MAX handling
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B09FB4796D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31685-lists,linux-renesas-soc=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi Brian,

Thank you for the review.

On Mon, Apr 27, 2026 at 4:23=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Lad,
>
> On Mon, Apr 27, 2026 at 12:28:23PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add KUnit tests to verify the behaviour of clk_divider_bestdiv() when
> > clk_round_rate() is called with ULONG_MAX, which is the canonical way
> > to probe the maximum rate a clock can produce.
> >
> > Two test cases are introduced:
> >
> > - clk_divider_bestdiv_ulong_max_returns_max_rate: registers a 1 GHz
> >   fixed-rate parent driving a table-based divider whose smallest entry
> >   is div=3D2 (entries: 2, 4, 8). Calls clk_hw_round_rate(div_hw, ULONG_=
MAX)
> >   and checks the result.
> >
> > - clk_divider_bestdiv_mux_ulong_max_returns_max_rate: places a two-inpu=
t
> >   mux (4 GHz and 2 GHz fixed-rate parents, CLK_SET_RATE_PARENT) ahead o=
f
> >   the same table-based divider to verify correct parent selection under
> >   ULONG_MAX.
> >
> > Both tests use an explicit clk_div_table with a minimum divider of 2 so
> > that the pre-loop maxdiv clamping in clk_divider_bestdiv():
> >
> >     maxdiv =3D min(ULONG_MAX / rate, maxdiv);
> >
> > clamps maxdiv to 1, causing _next_div() to return 2 on the first
> > iteration and skip the loop body entirely. This makes bestdiv fall back
> > to the maximum divider, returning the minimum rate rather than the
> > maximum.
> >
> > The expected values intentionally reflect the buggy output:
> >   - test 1: PARENT_RATE_1GHZ / 8  (minimum rate, not maximum)
> >   - test 2: 0                      (invalid, loop never populated bestd=
iv)
> >
> > These will be corrected to PARENT_RATE_1GHZ / 2 and PARENT_RATE_4GHZ / =
2
> > respectively once the fix to clk_divider_bestdiv() is applied.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> [snip]
>
> > +     KUNIT_ASSERT_EQ(test, 0,
> > +                     kunit_add_action_or_reset(test,
> > +                                               (kunit_action_t *)clk_h=
w_unregister_fixed_rate,
> > +                                               parent_hw));
>
> You can use KUNIT_DEFINE_ACTION_WRAPPER() to avoid that cast. There's
> some examples in drivers/clk/clk_kunit_helpers.c.
>
Thank you for the pointer, I will make use of the
KUNIT_DEFINE_ACTION_WRAPPER() macro.

Cheers,
Prabhakar

> With that fixed:
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>

