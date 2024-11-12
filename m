Return-Path: <linux-renesas-soc+bounces-10463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB79D9C4FED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 08:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8084A1F21FD0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 07:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DA3849C;
	Tue, 12 Nov 2024 07:49:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97098207A14
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397753; cv=none; b=Dug934Yz2vD8mO+d8GMjfJZqbUBq3YFSeUFi7Jc3k3K+OW3dmW/AabeQTXHK4Rvp87XpXIeC23lk+9mKQtBU24BJys9AOoI3uTLvUqLOZlK8aSQVaLbi2vsMRrWZmbhwVc1ORFbncqneYnnxGBOciWPsCjRy5ustPlj1b9GkpbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397753; c=relaxed/simple;
	bh=cM1XPK71fe/zcVN7crZ7b9Db5J0IStV3foqWQW72fFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdiWQwNT+fFQo5jcEgYOQtRPyWa2xzEcMxOOgho0g8flMhT379incbd+OzV9EnjZ5soGuZFPldtI1IPQoh7k7DvheVeWcBMBtwpZP6WRJe9kHb64Y8XSjJlmOFWedUhTI5+o/SJU2VsgE/DWqyM7VoCOcBTlayA6Rf3ekUc8evE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e3cdbc25a0so52859597b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 23:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731397749; x=1732002549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2xnusaTT4Jgvff9jW5qyCXGTNvUlrMRE+dAsbwz/zI=;
        b=rrkz0yz9GtDm/4FeWLPq9Ov12CfZQH9aOF5VZ82Xwz//75qaWmqs5eM8UykgBShoBh
         cVDeX4SMDRGZwH23MsLZdI7w83+IAkzP/yZejERCFQrcge3i8flMkS2YBotEDwRi3FIp
         psg3/cJzEDKgJ2gjThq2jcRpNyjjaQxADNYgupm3HdD6wXXlYQSO3K7gzqhl41ot7Ys7
         jvz3pJBGkk3KyhSqm8zV2d6/p5CI2Iyh6bfkWWPXMzvbqp/+A17FOU7mq+BsfcJH/ET5
         C4KHzFcJHybEewXI/isE8XkE/ENUq+9vLZ1Ezdh+iwOA+SGk+mToSSUp8Rm+UM7CuiVo
         En7Q==
X-Gm-Message-State: AOJu0YyUldy7uElDjhuxRm6SgI98Vl6+9/q4eusf5kyX2jqDUjpW54ny
	gkF0QZWJhdJCU2g9ld8j46zQMuf/NXt9s8qmfdenl8+zV+V4XR+nNZTdLWnx
X-Google-Smtp-Source: AGHT+IGnpxMYNcNo0NLsM09+QiftiNw2lOfd6c9NWBlHl8Tec25cjkXdyHC5ma/nEAtYBQcFJbpKwA==
X-Received: by 2002:a05:690c:6608:b0:6e3:dc4:965a with SMTP id 00721157ae682-6eaddd98d1cmr153164037b3.15.1731397749131;
        Mon, 11 Nov 2024 23:49:09 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eace8f043esm24670847b3.38.2024.11.11.23.49.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 23:49:08 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e29327636f3so5019449276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 23:49:08 -0800 (PST)
X-Received: by 2002:a05:690c:d81:b0:6ea:3e6d:2b01 with SMTP id
 00721157ae682-6eadddb0f9cmr141430117b3.19.1731397748202; Mon, 11 Nov 2024
 23:49:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67325cd5.050a0220.28e0a.76ba@mx.google.com>
In-Reply-To: <67325cd5.050a0220.28e0a.76ba@mx.google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Nov 2024 08:48:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2NcfaGgPYttgVMisOM1Y0ZAPjjTAumk5G6sJFC64zNg@mail.gmail.com>
Message-ID: <CAMuHMdV2NcfaGgPYttgVMisOM1Y0ZAPjjTAumk5G6sJFC64zNg@mail.gmail.com>
Subject: Re: renesas/master baseline: 33 runs, 1 regressions (renesas-devel-2024-11-11-v6.12-rc7)
To: "kernelci.org bot" <bot@kernelci.org>
Cc: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear bot,

On Mon, Nov 11, 2024 at 8:37=E2=80=AFPM kernelci.org bot <bot@kernelci.org>=
 wrote:
> renesas/master baseline: 33 runs, 1 regressions (renesas-devel-2024-11-11=
-v6.12-rc7)
>
> Regressions Summary
> -------------------
>
> platform   | arch  | lab         | compiler | defconfig | regressions
> -----------+-------+-------------+----------+-----------+------------
> imx8mp-evk | arm64 | lab-broonie | gcc-12   | defconfig | 1

Was this regressions introduced in renesas-devel-2024-11-11-v6.12-rc7?
I doubt it, probably it's present in v6.12-rc7, too.

>   Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/re=
nesas-devel-2024-11-11-v6.12-rc7/plan/baseline/

404

Thanks for fixing!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

