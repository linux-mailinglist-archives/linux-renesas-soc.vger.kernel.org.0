Return-Path: <linux-renesas-soc+bounces-9431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE0D990607
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 16:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED584280CDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 14:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82809217304;
	Fri,  4 Oct 2024 14:27:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB2D215F6D;
	Fri,  4 Oct 2024 14:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052027; cv=none; b=j2tfnCROxl/+TABo2eUsrGqFCbM40hkNCfcbsA9cfYM+RMTxRH4Noc7GxC49Jv1WQ2ioPDpZt9DBfC6nABJq6voMUJFaWrq5cQxLljWzA9sGBU1s02MiAVWxAvM8Nv1zg4cnGXI/P8zv48Xic/NISWixbKeqjfUN0rSWaSBDQM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052027; c=relaxed/simple;
	bh=ZVxmF2NjvItvSDqpnd9chy0jDtjTA98X2kNYU2BOykY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osduwX+wS2jL8YSLO+/xzPmtG2Em5wqgq42Oby9MnVDwt1dywnA0psK3u9fGRFqhfCqYxrrAK3RQnqol+3Ec39tjgYVAy2gQvfdmYka4p85EWgiALWr/UMneGb01CL6PEa6dEOiU/YXpMnh2A/urRdByy50m+kZRiK286Iy+5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e288efeb4feso1447502276.3;
        Fri, 04 Oct 2024 07:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728052025; x=1728656825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLa39PXadU+egBIMikzpV5uxqM7DtNu9UASPbBf6R60=;
        b=VkEM3TdkNdrGlrqHFk/oBSR3JfcfdSwRBMjMnNXv5TJGFPJSGAk641UD5TypaDaoQ3
         LFaap2EKjmL04/CTG8QpBLtsud/iKCS3rpKrmTM00EgG+Rs1GgJVYo2wbhQS1QIyMFIb
         0ulcnfiPK/MkgQ1MQLsPEqMYmjFJDEVgB7rtZo98iujdP5wFv0AZmfNV8/YasX7UxcJQ
         GgMIpCrOT5XfKLsuz2MoM5foE0X6Zfd86Ab0dypk12JClUkZ9BLO8FVEe6vd+ZvbfB4k
         akRpVmbqxh9ohBwor1ynWSdTdUA6PWik8MUScEIvzSq9XZk0rPjozua3T+Snu9Qcv8go
         PTsA==
X-Forwarded-Encrypted: i=1; AJvYcCXSWz891I+c4YFk9AkhGgYvVCE6KL6lA7vnPzP89UNIDN6CCSFT4s1Rzoc+Iomp90mmivfgIs1xTRsA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2uyW98LtL1o0UJ7kArB/IRJpWPLbzpWEGjeZG+5uYkhrPnyQX
	nvd0w7Q0G0tef6yZsAwWwEreyvpb0n9SXU2hYFBBtznYnqEN3o+q+0J9vwt3ABw=
X-Google-Smtp-Source: AGHT+IEH2rwBqevQ5uCRjfZs8P95r7XXjZ9QMKLCcdewIoW3tzYVKGlDWXeBLUnw3VqK32Lcq4fYUQ==
X-Received: by 2002:a05:6902:70d:b0:e25:d21b:715a with SMTP id 3f1490d57ef6-e2893928c84mr2596269276.36.1728052024610;
        Fri, 04 Oct 2024 07:27:04 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2885eb3760sm604132276.43.2024.10.04.07.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 07:27:04 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso2306414276.0;
        Fri, 04 Oct 2024 07:27:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGUASdrAx0laeTnbTLLp8fyMbi1P8cYEq7ZOWsCf0z69l/XxIJJb8WmtVdagjjhWod1kxl7OHCBOh3@vger.kernel.org
X-Received: by 2002:a05:690c:6282:b0:6dd:bbb4:bcc7 with SMTP id
 00721157ae682-6e2c729c5fdmr35202927b3.44.1728052023886; Fri, 04 Oct 2024
 07:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926110718.20519-5-wsa+renesas@sang-engineering.com> <20240926110718.20519-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926110718.20519-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 16:26:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUCgGMKHVmSsmfVSqPwWQDwODOWs=VnZiCndA+WnAf1A@mail.gmail.com>
Message-ID: <CAMuHMdXUCgGMKHVmSsmfVSqPwWQDwODOWs=VnZiCndA+WnAf1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: renesas: kzm9d: use proper node names for keys
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 1:07=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Avoids 'keyboard: 'four', 'one', 'three', 'two' do not match any of the
> regexes: ...
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13, squashed with PATCH 1/3.


Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

