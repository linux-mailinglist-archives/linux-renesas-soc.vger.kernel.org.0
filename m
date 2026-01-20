Return-Path: <linux-renesas-soc+bounces-27101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 735FED3C59A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 11:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3C23A4EA788
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 10:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A7B3ED13D;
	Tue, 20 Jan 2026 10:23:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8F43ECBEB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904598; cv=none; b=q2CrjAvFRReZ0AXlSAXkriFFUaqLm4ihhSKHxaYpQX9gyLanlEAsFqKHc+vDT7Gw/Aq/gPIJYYiE1zeiLM82uQzpFSKoXM8fOnNrZb5l2TqjHh2JbEYsH5ZMoIhXgk4o6YxfdJ00KAEIWzutV1znOWuJHsd7bH7jP/dKxjjV4bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904598; c=relaxed/simple;
	bh=ly0/vW5IDlDw+5wI+QKQKa0L1EivDoecPfiopYcWyII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbJxe75sLAoNcC1RRP+SY1N5vjxOf/yoZlZnqdYLVKvyOzm+IfpnvP1ua4gl1Flag109KUeY0xmjzn1/zFzyGP4VUMcCiXp7G3YMoV7NpGztCZiGHQp7h95CWCffoSSGpjV9V2FDhVIdNgOp+hDm9OhmeVAIXnZ5y5kFLCLLWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ebb6392f58so1620138137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 02:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904595; x=1769509395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0ac9c/OTxQ/f6N2lklbqJQ1hEcN+Ckhb/mx79x7PYg=;
        b=SyBmpZ1/brBMcVEf+jp9CYGviejuuukv4tjA6NZFJ3F9J7SMyHQkVuwYfySNmcY668
         u9E1o41o3Brpe7P+T6psgdhh9uiK9SmBvwiMrD5k6Dv3wMTr889oss5MxM1x+DtQhbSf
         O/xggg/OR2QFrqyxSYIKwArzk66beLLbOjiIRFwhklht7+YgTvfELQJHNDPuZCU59f6g
         hBiSxU1Tfnhv4/YM/l4SysAJdY3K1QQUUocfNdWsiX/+gc7B+mE9PCtgAV3e8jAqflK1
         x4rLU1rzMlI5FKrYOSIRpBayx5A+xHVbLUmCf7SSrI8MYijG4GL5R1k5pOqLYCCXzXNj
         cVgA==
X-Forwarded-Encrypted: i=1; AJvYcCUCHj6Y9JDohgx4WqpSMWS0oomnjW1bn2c0wQRoFbM7hdXlxpSOtlZQfS/xX2Pu23yVCRPJoaRtVss83x3hwIzeDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQSKoSOqEU9SeyVwcVPQduODSdUUA4rbE+XDHBL2iT1QssphVs
	unsh0ghMeSSi3S2q5S5cXn3n6klOdxqxEjnge8VRDPUNiY3af6g89lNk2w1+H+4S
X-Gm-Gg: AZuq6aIJlxx9A9AieP8gpnfsN5zkqzxxemvyInZl8Ue2fGw3776F3JWdNWqnSNp/91h
	MVpxkpeQ4xWAYuRBbemUOVnjCUv6XnIszgxN21DoxOVn77Zy4G2iRlf8FCWxZT7k+fs/rOQ98dE
	+Q9sRuqnRnJfwVOv6ADbpWmkSrbb40uatT3kjCjaP+4QxTH8pXAkhPzJ98F1mf4CRwiigpLwUSG
	pVVRRWzRQ2abLGSN0LU4msvw9a0onwiLyuieD7q4TmM87CT170NbiOyZHR2BAyfiMk+fX2C5JF3
	yUpIyc2LNMGSc4UWyM1rqLHm/PpLxWOGhtVjLBAd7FbjvnS06kIPwPrJAwMcFTMZEMR6Q2yxoLV
	2dfD4rRyIk5qkr5xKASLU143B5lRup9UyWjfY2/QIGvPLy2jaTVAJfh853iw9bevA3p2wwyekB1
	b5oW9FU3kpBBDV5xuRrL/iP5ZPYKvDeul0hFTccQ1wGNZBCJLNRPdm
X-Received: by 2002:a05:6102:e10:b0:5dd:b288:e780 with SMTP id ada2fe7eead31-5f1a6d21b7amr3527860137.0.1768904595156;
        Tue, 20 Jan 2026 02:23:15 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6925726sm4438033137.5.2026.01.20.02.23.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:23:14 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55999cc2a87so1149023e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 02:23:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0Gq+XV+JKrGfT9ibbHwYIaHujmYI01KzDYFbwgR3DHCfyJqBEp4Mc3cuYuFODFKP91YtEVdgQS+176dsOvy/P5w==@vger.kernel.org
X-Received: by 2002:a05:6102:dcb:b0:5dd:84f1:b51a with SMTP id
 ada2fe7eead31-5f1a720e344mr3802674137.43.1768904593920; Tue, 20 Jan 2026
 02:23:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117-grinning-heavy-crab-11f245@quoll> <38a146cf-8eee-4fbb-8783-231108a01b54@mailbox.org>
 <578745f0-0865-4195-9237-6d41c7fd55f2@kernel.org>
In-Reply-To: <578745f0-0865-4195-9237-6d41c7fd55f2@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 11:23:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuYJ6pSFXy9KBsgkbJ003HEEKhMPgUHkQbdJPFchR39w@mail.gmail.com>
X-Gm-Features: AZwV_Qg0GRK3xtZRzMXlXd6nCURzar6s0zix0S_d3ClYfwO2CsgqrBgFFjQMPVY
Message-ID: <CAMuHMdUuYJ6pSFXy9KBsgkbJ003HEEKhMPgUHkQbdJPFchR39w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: touchscreen: trivial-touch: Drop
 'interrupts' requirement for old Ilitek
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, linux-input@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Job Noorman <job@noorman.info>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Jan 2026 at 19:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 17/01/2026 16:33, Marek Vasut wrote:
> > On 1/17/26 12:22 PM, Krzysztof Kozlowski wrote:
> >> On Sat, Jan 17, 2026 at 01:12:02AM +0100, Marek Vasut wrote:
> >>> The old Ilitek touch controllers V3 and V6 can operate without
> >>> interrupt line, in polling mode. Drop the 'interrupts' property
> >>> requirement for those four controllers. To avoid overloading the
> >>> trivial-touch, fork the old Ilitek V3/V6 touch controller binding
> >>> into separate document.
> >>
> >> One if: block is fine, so IMO, this should stay in original binding
> >> especially that more devices like some azoteq or semtech might have same
> >> rule of not requiring interrupt line. Anyway, no big deal.
> > I am not sure about the other non-ilitek devices, but the fruitboards do
> > use at least goodix and etm/edt touch controllers without interrupt line
> > too, those I have on my desk (those two have separate, more extensive,
> > binding document). I also suspect we will see more of those touch
> > controllers with optional interrupt line, so if we do, I think we can
> > re-combine the binding documents again ?
>
> Yes.

IMHO more churn, and more git blame mismatches...
Why not keep them in a single document in the first place, like in v1?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

