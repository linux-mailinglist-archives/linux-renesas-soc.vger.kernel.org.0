Return-Path: <linux-renesas-soc+bounces-857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C380A7F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 16:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 873D51F21023
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 15:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2719434567;
	Fri,  8 Dec 2023 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dUAYIEG5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4b3Ipi5s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB261734;
	Fri,  8 Dec 2023 07:54:36 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702050874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6O/DmHCMHLUH4FV1veAF/8wiZY0/z4QkGmnuD54M7ss=;
	b=dUAYIEG5jE088Ag2fa2Z1rmOHZzMqN8lggzcGrdUF+qteYYY6+KScF/UWzOmEkwppSIzMg
	drYMKkylIh4/jkIuNwWg2RwRfCbgTFEy27hCcz9Gk15i9dRSW78M5DpeqR2QWEKRIKLyHx
	wDyd9rDgT2FHf75QyRs2uIi2l6vjA1qxtgW30iVOhJiK/nDRv0wwaN3/yoM2ixz4AokyV3
	zQJjh3UFGsZP+qwKuCSP1Jjc0k3T3iczFPHGvrAcOe0PUf5+TVU2oFxwJl21okm2QGqOr9
	HP3DNdUlp9E4kYFKpOiZ0aDPB40Qzxtb++qm4dqzsK4Vk2qKeTKYrhvStKL7/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702050874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6O/DmHCMHLUH4FV1veAF/8wiZY0/z4QkGmnuD54M7ss=;
	b=4b3Ipi5s1e37x7+vS4YcQAh1vTCM28hhl4temVUWU7Lfo1Vr/kigWJ41YHwTye0jWEYeM3
	fXhNrHzTehUYsbBA==
To: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
 adrian.hunter@intel.com, ajones@ventanamicro.com,
 alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org,
 devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com,
 geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de,
 irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com,
 mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, peterlin@andestech.com,
 peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org,
 sunilvl@ventanamicro.com, tim609@andestech.com, uwu@icenowy.me,
 wens@csie.org, will@kernel.org, ycliang@andestech.com,
 inochiama@outlook.com
Subject: Re: [PATCH v4 02/13] irqchip/riscv-intc: Allow large non-standard
 interrupt number
In-Reply-To: <20231122121235.827122-3-peterlin@andestech.com>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-3-peterlin@andestech.com>
Date: Fri, 08 Dec 2023 16:54:34 +0100
Message-ID: <871qbwsn9h.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 22 2023 at 20:12, Yu Chien Peter Lin wrote:
> Currently, the implementation of the RISC-V INTC driver uses the
> interrupt cause as hwirq and has a limitation of supporting a

s/hwirq/hardware interrupt/

Please spell things out. We are not on Xitter here.

> maximum of 64 hwirqs. However, according to the privileged spec,
> interrupt causes >= 16 are defined for platform use.
>
> This limitation prevents us from fully utilizing the available

This limitation prevents to fully utilize the ... 

> local interrupt sources. Additionally, the hwirqs used on RISC-V
> are sparse, with only interrupt numbers 1, 5 and 9 (plus Sscofpmf
> or T-Head's PMU irq) being currently used for supervisor mode.
>
> Switch to using irq_domain_create_tree() to create the radix tree
> map, so a larger number of hardware interrupts can be handled.

