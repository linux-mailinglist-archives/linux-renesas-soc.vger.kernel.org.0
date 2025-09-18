Return-Path: <linux-renesas-soc+bounces-22018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E3B83F60
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 12:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9329F177B05
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 10:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F15E1F1921;
	Thu, 18 Sep 2025 10:06:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5427726
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189994; cv=none; b=hv3PijYBP3M9kfUkqdOX3Oq/WiScV+Slyog1dhpBFFCrbpBaUuwx6P7T18EskrUh5QlS+AcGqivPM2749Oyj8Oy+gBGYme58oRXuemR5ggs8C+89sfOS3H2RgLoVzt6XTTnko2oJJIs99A69dXcR+pM7EajVD8BoCWScEpg2ku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189994; c=relaxed/simple;
	bh=Xhd+Zs+m+eFeRxYfwTUWH3/IgVMq5TlAz+/WIR4VgFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KykmO5Nmp0/8inq5oeL/rzj6TWQvwjEqiWMxF2gDea9/LD6Zm6TCYIfBCREKQ12htor/Xic78SiB6A6JCcts2/x0imBTylGW5spqormT8dOvbwxCgXe9rZiAkA0S4Zr0gUYs1sSBUSZoMg1zDFpcPG2pxgA8UA6igpXcas0dRmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5300b29615cso646522137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189991; x=1758794791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCgJo7Iim2r1QY3epPnNwQa02OhmB0pJps80hKObtxM=;
        b=CAOhi6jyjxcG/8Jqg+pi9UKLx5IDXKLGx523QXT63P9i4wb8zZRSqxHvE6md5CGpzP
         FreCNaJMw9CqO1zYoT8InEDovmZUHHCEVWy+iJXfL1/Jq/ddAAM8wI4I9TY1UUaECceD
         H1ofZMI52tv/t9kGKwxcf4Yex5M82qqwzFWGV9qxp+zdVYgpvCRU9TNS1A7MxJLySvQK
         xllPhjwkGJuCDV/tR44PzX67JNJ1U5uHUtNPN0F0syfbhHUmMldZPFmpiImDezAroclX
         mnJOZ02nBFaMmRYD/JtTWIa01Ttz0paOAHMk90Ck3HphjS+5z5oNyE37481lqI+nT3uc
         QgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlQCwSc6imW5ULfIWFfqFHbAGCIXckOw/Cwmjmd3j8JNG2pCMDRcmp/DjIoRALvVEPBtOKwzu6czxfPx1hIReoRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys0BPq/nurtpT4v1N7HjtEFGfcuslQILkZDnHOolDYQcKN/1mE
	jViaHfILr97OJsoPgw3a6PzhULODZAXH31G3vz9cwPfcML2AnpXcgtf63iQtWWX2
X-Gm-Gg: ASbGnctpquRi5NtHqoTXK8vPDtFL+KJaqe/TWHZWXFjc7mlpl8y87PFOPpv0hEOcmyT
	OvkA4ItO0mldsTHTndrJxcy8WTsRI0BkIi+vgfVm1dSeMGTkh34Btxn642VxmfAL3jTmpinWUIT
	D5sI1SdLoauarUxvKm83wZQGdvdjCoZVVz9E4QWTer2Wk+EBlj0WLE0VjZmZYZBCKc6XFpqJLWT
	7nYV4H6ZHAxGdxhaI8cZH8tWJ9Z876b+lAhZPpw8F2SfUU4bcHKegmGo9EzGMZXGb07RPpzIie3
	gM9/0Fa6Svou4Bi+swIr3t1h+b4WvhVQTT/XxFH492JBFps4vBAGzGHbKFbCMcTrapMaifJMLkP
	wxHAFLcIKUhYOqGJ4vUoVK9torwPvZKycyKRGr07lE2Kq+jkbg3Kl1DBkUdLf0vncIjrFSYRS/z
	DaBBc=
X-Google-Smtp-Source: AGHT+IGryJGO5G3ieuYtisJ/EqCujG3TFi3DdIabOFXrg064UmUuwhNCOiT7kgJbyScHuWyH3Icnkw==
X-Received: by 2002:a05:6102:1514:b0:51c:4443:16e0 with SMTP id ada2fe7eead31-56d6c15be33mr1822204137.30.1758189991612;
        Thu, 18 Sep 2025 03:06:31 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-579ed35f674sm498739137.7.2025.09.18.03.06.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 03:06:31 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5570a77eabcso571311137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 03:06:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXX8S3yvre85UxNqlNSHZckOJsO1T3gr/x3Z5GMsaxJ8IfG9XuAgQY+hR+s3aAt3j/Zz4hsEfbJBZaFUopMxLtx8g==@vger.kernel.org
X-Received: by 2002:a05:6102:4b04:b0:4e5:ac0f:582c with SMTP id
 ada2fe7eead31-56d51ca1fcdmr1779501137.13.1758189682008; Thu, 18 Sep 2025
 03:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com> <87cy7onul5.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cy7onul5.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 12:01:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8+V-EbrSFF_f-pAm95zZLtV8mMjOFAGX+af2JO9Q0LQ@mail.gmail.com>
X-Gm-Features: AS18NWABsRlKpDFFCpae_UW48HuvCqA9B-vtOkVv8ToG4xGXl4aYc_QckQPRgYY
Message-ID: <CAMuHMdU8+V-EbrSFF_f-pAm95zZLtV8mMjOFAGX+af2JO9Q0LQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] arm64: dts: renesas: R8A78000: Add initial
 Ironhide support
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

Thanks for your patch!

On Thu, 18 Sept 2025 at 08:27, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>
> Add the initial support for Renesas X5H Ironhide board.
>
> Note: It is using "maxcpus" in bootargs to limit number of CPU, because
> SMP support is now under development. This limitation will be removed
> in the future.

You forgot to drop this paragraph.

>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

