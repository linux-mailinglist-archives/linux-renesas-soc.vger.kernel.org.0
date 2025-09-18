Return-Path: <linux-renesas-soc+bounces-22012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ABCB83C72
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 11:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DD67161A0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 09:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9235E2F069C;
	Thu, 18 Sep 2025 09:26:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3B27AC4D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187588; cv=none; b=Tk0bz/TADjI/cI8c5iRXdNwQC8pBQm/WTlmxr/YS+8/oBUQCF0ws1AqwowicsbbIhrgsBmHBl17zoFf/Dh8UwgWeoYU0YN+rhMyiS4z+WN92IW+T72/r6OjZKqxGSSmDz9yTTfXojssvxLKRvzvmmiXUaTAsHD5fHEF3faT6uyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187588; c=relaxed/simple;
	bh=onHsAQTWsUyBs5IX1LlfYCWKBjpstcoF4upDP17pgA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ugr2LHZDrSymu8Lpsd5gacIYEtwx4dhoTAvY8waS0mA6EdFrtLCwnj4Y9+ouy7aDYU3OWDSjEkz9Shh3WUMr2yEgrMBH6xmIMyWcxvAy6vGH4AopvBBQqIZsvYMTB6UxbMjtv4eUoptFb3nX+eDx+il2Bo54jbKyebIKQjLSyGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-89737fcb219so61731139f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 02:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187586; x=1758792386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIPAGga4FOA5RTuOCxh82ZFvj8TL8c2aRMORyqNz1+U=;
        b=aVXZZyW18IQ7P5wM0VnPj8xiY/7+PMeinI3A3nWux3WmaXOjZrEkJ/eXaQiQW3BKKq
         recQT8WRD9Cf5KbCex2QTxF+kBZRw1F8ZLEf5Y62+2d8pqrbizMGFza1KxHiYNRm5X4g
         yV45cvkCRi19z75MFqBRpKv78z1x8CEtFtwbtRpoWp5EStyP3WjYUFljYo+/Y1ZwXokC
         io87ikIvUX7pFVyeVYybVDUlnTE/9IDu09y6H3nm4rFU8XaEUhYnZH7fhsXUSzTChHs+
         +h1BqUFxTXMIKWiNkTrDWyYAY3E4PjO1tPhh2l4W4Ds4eyhi4m4SX3uOiRZzd12lMunE
         hrzw==
X-Forwarded-Encrypted: i=1; AJvYcCVdRtGlO8ojzAw2cwgV+w/bsHEp6s+yHd2OXxy18hGr7LF8yMhedg2jZ8lxlZs2TOzLSAPotbEI7WH3x7h0hU/LXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAWwn0xM7sR7SrMOKBpTu/8jR+bGYDjf4ClHnFOkXm/yEmtnv
	0TMMpBdmS+xE6MPnC5XLVKNXKKlZ/KNr+zx2hta7B+I95MADSSZBjvEZYiJcABK2
X-Gm-Gg: ASbGnctzaJCHBaNs766HIy+WRSkbzIGs4ZfHDorhJNqhU0lNbLE04YvXiisNQVSr7iU
	B9wbYgVkExyfoRfxOT9HH0XAPu404T6FVaTm5OFGILCX8j6oa+1GjLim88TOCWkkfXGYY5yPxFu
	9c2MPEMbxW2WZBGwAd9moYfLf7npJwxrrArXJNp7y708XFljSL4MbN6CfCA5JOGfhVr9gUxizEi
	7gmBvQxGysT4e+xCWF6M6oabp0CRwnnuRiYAumuzXKYE49FlbrFu6QsRNWpE5cfbyRHKgYYXfR+
	wImjU21MICIf2lgTTlc6ctkV89zNfx6zivAX+mOjMD3BVtREsR+63oskybEZJjRxsNwlVYeU1Bu
	VSYKHeXHQAJtHrhaS1TeDNCDXRXhgu5bq6wKiHpy2Hh4fCpo0pKsblCT20QOhfYORfj1YdlamuH
	iNO31QAJ8=
X-Google-Smtp-Source: AGHT+IHtAPLu3IaqmphboIuOgPK0BtnacpmZox05zxchAz1jcl2BUHAH7G9ItshDtbOkDLlUrpwpHQ==
X-Received: by 2002:a05:6602:3886:b0:88d:f257:d6e with SMTP id ca18e2360f4ac-89d1ad82b4bmr825271939f.8.1758187585593;
        Thu, 18 Sep 2025 02:26:25 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46b2f3cdasm63075639f.4.2025.09.18.02.26.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 02:26:25 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-423fc1532bdso8618825ab.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 02:26:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1FZW+AEAFQanonyhsMoJMNftpz69RiMA66acm4mkS7OQTzqaQDpaD00EK1zu8JhJQSAOmjqDjGrGjOt43fvMqcg==@vger.kernel.org
X-Received: by 2002:a05:6102:26cf:b0:4fb:de9e:6d87 with SMTP id
 ada2fe7eead31-56d5376a64emr1999299137.11.1758187210414; Thu, 18 Sep 2025
 02:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com> <87ldmcnup1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldmcnup1.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 11:19:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+59oaCo5oOqTLhQMDV=SJhvBu-gGr4vUzyyPxEEBJpw@mail.gmail.com>
X-Gm-Features: AS18NWB4Q9Ufki8ANAbzyQzmxL_5lVd8LQK2sw8BXyMmuM4p3Xg-lO7FkssDvz4
Message-ID: <CAMuHMdV+59oaCo5oOqTLhQMDV=SJhvBu-gGr4vUzyyPxEEBJpw@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: serial: sh-sci: don't required
 "reset" for r8a78000
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Thu, 18 Sept 2025 at 08:25, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> commit 6ac1d6047372 ("dt-bindings: serial: sh-sci: Document r8a78000
> bindings") added r8a78000 DT bindings for Renesas serial, and it sets
> "resets" as "required", but it is not mandatory, because driver doesn't
> use it. Remove it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> I'm not sure this is acceptable. This is optional patch.
> If it was acceptable, I think we can remove "resets" from required not only for X5H...

The question is not "Does the driver use the reset signal?", but
"Does the hardware have a reset signal?".

According to Table 12.1 "Reset Categories and Reset Source" and Note 2,
the Module Controller takes care of Software Module Reset.  However,
I couldn't find information about the individual module resets in the
documentation for the Module Controller.

> --- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> @@ -126,7 +126,6 @@ if:
>            - renesas,rcar-gen2-hscif
>            - renesas,rcar-gen3-hscif
>            - renesas,rcar-gen4-hscif
> -          - renesas,rcar-gen5-hscif
>  then:
>    required:
>      - resets

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -181,7 +181,6 @@ allOf:
>                - renesas,rcar-gen2-scif
>                - renesas,rcar-gen3-scif
>                - renesas,rcar-gen4-scif
> -              - renesas,rcar-gen5-scif
>                - renesas,scif-r9a07g044
>                - renesas,scif-r9a09g057
>      then:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

