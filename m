Return-Path: <linux-renesas-soc+bounces-31364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iASSMb1c4mlM5QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 18:15:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7D641CFE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 18:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B7333003721
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 16:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F84B34DB46;
	Fri, 17 Apr 2026 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljznqHY1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5E34DCE0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776442546; cv=pass; b=CbXr1dgHAHJi3nj1zAul09e3jWbH8ET3PXmYNk75k7sOVspFKX9W9aRS/5O/njCTEkahu8h0UX57lLFhlF+8ntIL31hW/weiftbXodPclj/gU+39Yo1U7zZaEU4mzhstErqIIrGKBrfZMzKx62xqcu8y+K9cMpikPI8iIh6mC60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776442546; c=relaxed/simple;
	bh=0nPRdwPTcNMbdV4UkZI9wQ6uU22Kb9AQnSw3udYXGGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhzbScsFJ5OihnQTGmtvZky/640tTig2GzklPaSlJ3wEypxQflsgKM7Gm/yBgzuIcX0FXiBXpM9x+bEixGF0V6xrB7xWxEi3TQHteZ051pK/ewV8BaLdlXGRMwEcp6fAqa/lzoEfqS8PU7SE2rUy22/901weWB1OitrWqKqDzgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljznqHY1; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so637922f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 09:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776442543; cv=none;
        d=google.com; s=arc-20240605;
        b=bN3JsUotHSIYZlnCjS3PYYqjkUEwU2wPBfxTtQobY9Tgg8VKNthU3XGSawPwR9JSc4
         nOy8U3l8N03IprhvdUsPtgjFpJl6nas3vmrXJ2FnjISgct0aLsdPut2EQUUcmJs5rtMn
         WxJ4PgGcysMnQy4IC0IVPEGyKpuySJvXZ0FFnvwel8RoPkkFyK9oqrgClumMufcHj78h
         3qy6S425Wgc4xb9VHZKFYiRYxTXx5CuMLGlNZRf+xGTi6VT8rPiEs1PTUL1H3k5TZiQC
         2ejJcjvekhVDqWgxZnkdsvFU9rWvU3uw+xJX+Di5unr2YZs3llBkwYUQ2AbBC+zihhu8
         NqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dP+o2w+X2iFdwwVuW12Ivj7Rxb0Cneiw0h0ovvf8Re8=;
        fh=hjVAZ7EfpUlGb2KQVN2Jp/lPg3RLIicyXSTDvLl1vMQ=;
        b=lOjYm+wAvkwqMk0wVHSEGT6ULwOD0+f2hE+uAQOXe9Ip/AihcZPxZSh0CKSb/IX2OY
         8nxUm0lz6bh13p6/95Ybt9m7WRcwMRC4MJbemn7MybZHWFR9uYUW7InhQUl0fv8hDjux
         U5WjbEeTzjOhx2rZeKhuXRxw8J4P8CEv8awhX/z5csS9kCo+3IXrBq3nvPdls+zy/BNN
         8j3gfJaUmIpriJ9SEqBpmHrwbDJVF1b3Hhv7d1/ZnPPzbIBtoTLYCgIzYlueAVc0+d0v
         Ojr+ixbp0nargT1v8SmRUqyLkSuflC2PqCCPvWVTfSnIRtAWDBw5KQ/pv5ZTw4MWc0HT
         ILKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776442543; x=1777047343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP+o2w+X2iFdwwVuW12Ivj7Rxb0Cneiw0h0ovvf8Re8=;
        b=ljznqHY1YLhkMU7pA4d7KXQuhG8GN1qHsqdt/7XrJE3+4r8erIH8RvrRc8QBZpe8XU
         K1sA/PefL53uAI5qFDIAIIUItRBk7Dgcqcm7Hwf958ISBpsNDBXJCvSCPmVfK6R2lsvl
         r8UQMH4n6/rdHNivUJ5u5HnMVLsJJltr3rzG/s3KdpZ57t0g4m72HB/TfczcudFZ9ygb
         DLt8xldo9VBZa+gJVWRlZDcJ9KM0sdekatjb3mfq9ojyPYyR8WcyzDDe3mABPntKMrnc
         luh5BbJi5iouA8k51r7PxTOpb+blr3wny6o+uA2/5tkCUvFNUSlsH8tZiGS73nAAVl+T
         QJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776442543; x=1777047343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dP+o2w+X2iFdwwVuW12Ivj7Rxb0Cneiw0h0ovvf8Re8=;
        b=GHCCMoMmbf4e8TpI0C+QRbLoHGgL8wJw8JOroDXfjtNPynZtsKPjI82Y5Y7Lahx3C+
         HghoW6hOP8cF9/uVA9h2m3FdlEQF5rihcWBGSQrTvqyJ1S3HcvzT4Qne7o4j2LMmPIYl
         5z4s7c2FOD8LzEKY4HjtI5+7egKo2YaDkFmsqevPAD22w3Inok70A2z5nMVJ2ozEJiZ0
         4WNwUkmg00IclTrGVE9wI4rM6Ybg/GkRrspK3bUtK+2BtCs/ftJPTEKWPekzitBeaT2R
         dq8T+E3CxR699CWKdi+oJySnNjKt6317KhV17WYoCscJXyvQQh17eYYIbbqppAuH18A8
         eRPA==
X-Forwarded-Encrypted: i=1; AFNElJ/NsRAQaMXJ4bXASTZJNsCHihtsRO4jpy1ZQ8nE8DijVkZq6/vRNj+LTTYQJSrWqY9l+GHN3Tk98SjlntcUPL5Wzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Y1jSE8D7HAqw1yrL2LaGiUGsbUnPLTBQHxE9vvDThaov6zDV
	JtPNEtcCbOlVyOEiPF1YKNoej6z0gVknC/BzmnVUP+Ke88fXDIpLjuScpnatlM0YHKFpWsVhvnb
	IspVoIRnrFwMfi8okxBsPVqKNvvmtRKA=
X-Gm-Gg: AeBDieshI6A8qsR78ipVrcsKGIFziG3kNK1z0eqgL11ZZAlJeHr2pb+v3PaWFm/wMaz
	03AC7KA6phTJUq0eogyhGrl6jGfwmOJNaeuFoARzTOmIs/RX9XfLYr3TEfC0hVYqOPG0kwm6bXu
	WT7Y9EbSQLUmrFdbHlaDPP22RC4kMQ1zgdO/dXoI9xgbkc0jW4vUbel5Pe4KmPQU+ov4jGASqWs
	IlVnW6MpAObV0XpPfS3DiFHdU9jEwnYezQsnHcDKTto2GdN8e8nWRJ+aIr7UgFrgzn8Grx1DtXb
	REfmMktn9onW32l5U9wYcUq66QdO4A5+9wRF29h9dyW8v4Dw+ZZ0zAF77ln99dpST1LJObnDtTr
	vxFY=
X-Received: by 2002:a05:6000:2712:b0:43e:b020:f8a4 with SMTP id
 ffacd0b85a97d-43fe40915ddmr3408182f8f.23.1776442542974; Fri, 17 Apr 2026
 09:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aeFWGYaRownx1jdp@redhat.com> <CABx5tqJ2PJQgiHpq=wBrobhHzU9bPgE0A_Y7khg9PK-pZUzX0A@mail.gmail.com>
In-Reply-To: <CABx5tqJ2PJQgiHpq=wBrobhHzU9bPgE0A_Y7khg9PK-pZUzX0A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Apr 2026 17:15:16 +0100
X-Gm-Features: AQROBzCTKzLKYBJqBG9MNY7O1TXJFoWrxLdeGxJT4_gq71TRls1IhZhFz0KHqA8
Message-ID: <CA+V-a8vjn_emiTkppdLS0wn85eTU6tqNhr24hfgF9qg6=s0BpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: divider: Add some kunit test suites
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31364-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EF7D641CFE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brian,

On Fri, Apr 17, 2026 at 2:21=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Lad,
>
> On Thu, Apr 16, 2026 at 5:35=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> > On Mon, Apr 13, 2026 at 01:49:12PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > +     /*
> > > +      * ULONG_MAX is the canonical way to probe the maximum rate a c=
lock
> > > +      * can produce. With a parent at 1 GHz and the smallest table d=
ivider
> > > +      * being 2, the expected maximum is 500 MHz.
> > > +      *
> > > +      * Before the fix this returned 125 MHz (PARENT_RATE / 8), the
> > > +      * minimum rate, because the search loop was bypassed entirely.
> >
> > The "Before the fix" comment should go in the commit log. The comment i=
n
> > the code should describe how the code is right now.
>
> To demonstrate the existing issue, you could structure your series by:
>
> - Introduce the test as the first patch and have it show the issue and
> the current behavior.
> - Put the divider fix in, and update the test for the new behavior.
>
Sure to confirm,

patch #1,  have KUNIT_EXPECT_EQ() with a false positive.
Patch #2: Clock divider fix + updated KUNIT_EXPECT_EQ() with correct
expected values.

Cheers,
Prabhakar

