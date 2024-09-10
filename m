Return-Path: <linux-renesas-soc+bounces-8895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14C9738B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 15:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54CC3B20FCD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 13:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B3818EFF8;
	Tue, 10 Sep 2024 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwV2qZmF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D81E493
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Sep 2024 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975369; cv=none; b=rBOdaUgAijJGLqg2Plnsg7iNE0NSvOJFHDdXc508EOB4ouZmMvI39W5d1Uh7CKSt/x6lTWXWfvHVwiXiznccvSPniQNZ+DaIylpVwN5jWsL3GPO/JKVn1+BUdiWwOd95By13I2G378GLBKO8KDdnc0INMR6O05B5iWFpFocdCaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975369; c=relaxed/simple;
	bh=bWD+o8KR69qXBUVSFXEAR0R1mo4D5zSs0Cl53nCCUp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nFz08kOOvFhuGILtsQbZTN0W8EuI/PrpsrkUMsQ9iLvz4CINAxZue95eMQVujL0Y8Pkow+yHuK/fEZ1sR8r/0ekWq73dLyiyBTaPoYd1d24SkUglW5AMYlB33RRulZkEyATq+iPGhmZ1PgMk4tY0R+zKdX8jhRXwh5J+Ct0iFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwV2qZmF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725975368; x=1757511368;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=bWD+o8KR69qXBUVSFXEAR0R1mo4D5zSs0Cl53nCCUp4=;
  b=iwV2qZmFBcdBj2dZ4BS9veSSEQWNhQB04k+P+/3XzNAQ1F1WRjLBr88g
   z0qafE3Hi0yPeK43KbB/6hj8lanuUoCdlpmlIkVPtm9Ap2/5HjtrWu3dS
   SY0rVfOR4RRJak9KmdTCwMOI/EEsh0S9IG2FCt0PhRfOjB/AL1fQK7bFB
   fHYMxJSN53s60TgSjxmZwLmkKSB+EBUjjzfmWcB7Qnp2obKhlvc6Q2VYE
   RfWZ7kJ9+PHB1wjHGk5uOkVWf9iYA0nE0GYXdaqYl//J8FtQH31Efv6Op
   0ji/Vx3FY9AHZRjQz81tFeLM/qxnVICS/vjojuZ2H1lcWlLyzx/3zjF7q
   Q==;
X-CSE-ConnectionGUID: Ejd55ewVTheG199xnlpcsg==
X-CSE-MsgGUID: Ae23A4NYT/C4aVJH+pny/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28501154"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="28501154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 06:36:07 -0700
X-CSE-ConnectionGUID: ZbmI76sOT6q2eUd+7Tv9gA==
X-CSE-MsgGUID: GamQzzQKQ8isLVFasF1m1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71624320"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.43])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 06:36:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/8] drm: renesas: rcar-du: annotate rcar_cmm_read()
 with __maybe_unused
In-Reply-To: <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
 <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
Date: Tue, 10 Sep 2024 16:36:01 +0300
Message-ID: <87jzfjk4vy.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Sep 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Jani,
>
> On Tue, Sep 10, 2024 at 12:06=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>> Building with clang and and W=3D1 leads to warning about unused
>> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
>>
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=3D1 build").
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Thanks for your patch!
>
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> @@ -32,7 +32,7 @@ struct rcar_cmm {
>>         } lut;
>>  };
>>
>> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
>> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u=
32 reg)
>>  {
>>         return ioread32(rcmm->base + reg);
>>  }
>
> This function was never used. Why not remove it instead?

Can do if that's what the maintainers desire. It's just that sometimes
it's better to have the implementation reviewed and ready waiting for
the users than requiring the first user to add the implementation. I
opted for __maybe_unused across the series.

BR,
Jani.

>
> Gr{oetje,eeting}s,
>
>                         Geert

--=20
Jani Nikula, Intel

