Return-Path: <linux-renesas-soc+bounces-11698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2169FC11B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Dec 2024 18:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5B1165C00
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Dec 2024 17:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434DD1FF7AC;
	Tue, 24 Dec 2024 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqC4kDGz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832121C3C15;
	Tue, 24 Dec 2024 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735062972; cv=none; b=Z436Prz8M/ySFkMeN30R6r+/njTt6ZZiSJnyV3+IfR17MKVs2H89cQ5IT9yUWFKUw+Wp3KAYXRocssEUYsXWS/nbpl4gB8HChAqkrDu9fVI3uhEnPZ+mbLm7xoDOg1A3czA/QXxJ4+VLNBnezZq0FnyhcDOJXdI5iI2M9XqxmTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735062972; c=relaxed/simple;
	bh=ABGN+tIl/xWqTu2qM31EYBi8ppBkweH9QahT2deVQmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfZ9YJGcdYVjYBTH+QQHEnxe3Q1cWmvcwDKusUvKhlFW5/sqOTD5j1yDlLqn1zSGl47teor1AKKEpt9OzSlrTqRvgr4xiKWGoeUc8R67D/09p0lfjH6WsHBu7vLEnSA3gB+ubRqlHjHJsprN899OAlqA4nuFVzTei2Of1Duvo9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqC4kDGz; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51bb020339fso218258e0c.0;
        Tue, 24 Dec 2024 09:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735062969; x=1735667769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4ZFlWCxMideknpI/WJabBpuLH0nBl1yUOtKktfxVek=;
        b=jqC4kDGzH6+GMzfcN9ejZX3c9+o/oei6DslZTyRnMGXkYgYin1uMKal3HV/eWOUv/j
         E13Ve1XDp32vUsQATGQEnHLssjdR02tPLXVsooXaHl0QQIiA91q359ou3ESGKulXnOSM
         AT1PGx6yy3qQAJelEDMIM6hEoZK7PtgGObdRDZTa5gSrASO9kUPEyRwCscK/LvUmXQuA
         befBpceRK+pEJeqthmm6dpJ8ofUXh60ymI6u+HAkuPt89t9anFFlmJwq0WxDPmsTQlwC
         kSCclfI/tfEae5FQKMnQVj9DKN4nyYgVmV4eIJOwiXEhNjCxk92shTDFAAHIW5KQF1wZ
         pNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735062969; x=1735667769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4ZFlWCxMideknpI/WJabBpuLH0nBl1yUOtKktfxVek=;
        b=kgCmW0I4bxEDMXNg1xVCMotMPIpujHRUEyKF6GX7QuuHTD490pVXWsoTbng1qKomFk
         qxV8RvPApYiXCK0It0U2Mnt3d/mtnEKSyNEzrtaQH6laJ7Q0Vcx6zUHncXDacg9qYdnU
         ZA7OPT+smrygz1uCEmJLlbfSsdjum0GWMBYYup19WSnb+CIsc0aJas5WNkoLEkwvFuji
         LlzRNZiNd08aT8MUq377OoT/cPdHLJhxiWGFc83cqflcSzVCoqeW7OpcrMkzWHoYZRX4
         W6cplO1kFL7ovZX47mNvVZ/sXw9vBHJI+2sT7dOBlTIMXuErc+elo2akTZ5nbPSXvzON
         ekEA==
X-Forwarded-Encrypted: i=1; AJvYcCWBS/HlxvBAk6ms1XQhhbQU32KhZ9oTgbybCOCWRga/mb0bynA+0+qQc1vM3XAXqjPIDT6pW5LYjSkE11YB@vger.kernel.org, AJvYcCWfLCw48sA3pplFJXNxuTWem/pon1nTzdhyZ+J4mud7eEaZYjLh+E0S92s5QePaIvjZK1K3TIRKs3UR8RnF6p2/OvU=@vger.kernel.org, AJvYcCXAVK4g2fLMflAycWjaukR177JAcDvCXid30/YAcBu2dCi9pMoWw9xLmrshgiaVL1blVP/RbiaDj6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT2Jdj4RZKvV6Zw1IdGpSMEqKFzN0L0D1kWl3BNInk4SG1ejsz
	cJKG7sUxKEbR0FpoJmn49ErxfQD5Na86SxJnoWkA95tm6Pp5Vjs9p6Xs+G8oWdtkx9p3oYQK5IO
	wJxyXj79trE3FO6e7zz1MUhA1kYk=
X-Gm-Gg: ASbGncsvcF6qnz2dWEGM7m0vS6k2QaOQzMlgT7j2IrE0mpgNxL5wt361/wvHjGdmg/O
	kVaXDSBOSXuZ/HfgbL5GsxevdmkarRwlq09lK3hQB4BZ9vfPXvC5Bzqk9xR8dOFiXdZha4zyd
X-Google-Smtp-Source: AGHT+IH2BQbja1ScFyd1htesUKSzlhqcDH5gTJN3Fl/0YrAgotdoVx/LzvnAD1Fy72ORap20JdleILGxPDQMJ9lbqno=
X-Received: by 2002:a05:6122:d0c:b0:518:773b:39f with SMTP id
 71dfb90a1353d-51b75c5a23cmr15793236e0c.4.1735062969281; Tue, 24 Dec 2024
 09:56:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241223173708.384108-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVe15kQK-4mXkeUE9J9faf-_--Qx485GGimx2W02qLMOQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVe15kQK-4mXkeUE9J9faf-_--Qx485GGimx2W02qLMOQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Dec 2024 17:55:43 +0000
Message-ID: <CA+V-a8u_tB951Ha4Y8X8Ef2u7D=znh0i=HZRZUcBAv8aRYUsOg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Dec 24, 2024 at 12:55=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor MSTOP handling to switch from group-based to per-bit
> > configuration. Introduce atomic counters for each MSTOP bit and update
> > enable/disable logic.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - New patch
>
> Thanks for your patch!
>
> Early review comment: the big missing part in the patch description
> is the answer to the "Why?"-question.  So please elaborate.
>
Ahh, I was under the impression patch 1-4 will be squashed into the
original patch series so I didn't elaborate it much. If that's not the
case I'll update the commit message as below:

clk: renesas: rzv2h: Switch MSTOP configuration to per-bit basis

Switch MSTOP handling from group-based to per-bit configuration to
address issues with shared dependencies between module clocks. In the
current group-based configuration, multiple module clocks may rely on
a single MSTOP bit. When both clocks are turned ON and one is
subsequently turned OFF, the shared MSTOP bit will still be set, which
is incorrect since the other dependent module clock remains ON. By
switching to a per-bit configuration, we ensure precise control over
individual MSTOP bits, preventing such conflicts.

Replace the refcount API with atomic operations for managing MSTOP bit
counters. The refcount API requires explicitly setting the counter to
`1` before calling `refcount_inc()`, which introduces potential edge
cases and unnecessary complexity. Using atomic operations simplifies
the logic and avoids such issues, resulting in cleaner and more
maintainable code.


> No need to resend (for now).
OK.

Cheers,
Prabhakar

