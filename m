Return-Path: <linux-renesas-soc+bounces-23499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53738C00FFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80D2E4FCB22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9F6298CA6;
	Thu, 23 Oct 2025 12:07:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3F02FD66F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221268; cv=none; b=ciC+UVTRSOrJh32/+qJMyQIAlXKhDOYzguXU7MLCAmSRScu2qqrRzsRaL3bRhVF/Sg5dm+DqY13dMoz5P94zg9JMkTEq1baoXaLEEmWAUCgs7A8NvZQljvIc2w/iuLAOeGU91jiTH/g2NbNCMugd7wwFsra5zuIWzubHoBGbizM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221268; c=relaxed/simple;
	bh=QhbN8r+FeVInBIo/fiJrSFPH7EhpLOxaAVWY0WLSBSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRJDXj3KX2OO8ouTC3rQ0aaZaJCXz0Gkk/gScKnUwejwKWXpLFZ10AjmNC+3ptdAsolRcb41p9I5btvCpsd++OL5CO+i+al97z+HhK/Tdf27FxF1ZjOoKkBu3197KnKzkU5U8kZqzIExRQeyeSugCSm1drXs0lWQSipWIyuIu+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-932bced8519so557898241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 05:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221266; x=1761826066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBc63QGd7BXhtM+lMELJZmBYVxWnaM+uPvhZT/wm8AQ=;
        b=Vb7zWI/tgcPG6wdrwaivLyhUKuxE0fEitkgmzbwAi2XNWcNDAdUDBeIdaFNy/mh2uF
         UmD159oWybV+v4WplCnD1ip5tlRGonPDTywqWnDjUMVQqNV6okQdNBVaFakeBbKf+sce
         bzeldjGRpBcpAoyxhi//rpNxoBxNJ1kHyrL6cUxK2dU2jKvgFmZMTO4QgAOUWEFGs/JK
         5HR8EPKgfDjYw4XonI+kzswZplJYsJafFSs/Pbc2qRzOEaXMYbAkj+89rMDA+ItVEhiM
         qVCOmdwtd/fm3j++VUcOO+G5DHI0eyjbMoy5FCYr2Vy3ovDKmj7+lknkKJIl4G3ILSLD
         mWWw==
X-Forwarded-Encrypted: i=1; AJvYcCWDaNZ/6j6YzCiPbmB04klOGILemqTceI5aE9d1JNGibsmto6+b2hh15GcUFyXxY6gzMtRCWXzVyCx55R7R50xDuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlasm6w9a9V2hK7NABQwrz1SldQ8Aebah1jAnMj8MePApj7do5
	Y6JyiUaFDIQ07HE4rxnd85ze+uLiT4Owci0SNFvpLPD5ainrnAHmI6AxogtpGkzm
X-Gm-Gg: ASbGncvH+svbeSTqsL931Momyhbd63e2dd8Cw1DQPq2Eu+ABfLEsBb+etq+bMlOZpeJ
	rDvF4eiW5Fqsj3RMyfopCZI4UExSsrWkopQEi3l54+mbFoy6jmilRrmnxT6BBqfp/+QgJ9mFP6Z
	ACE9l/sWFArryigb4wLqsEUCFVrAN05cv2bPtjFyILrHW/4SmskYQDfmREYZJOMcNbdAtMTW5o6
	S+pm1c9r6fDnK3+T4wEp46HeL0Vdd8ulkGX/Zn7wp/nxBIVkAsLPBEdXYTGWaZztPTksYbJi8+U
	tCj+lRyXjdn9BaTslbYzMQQQ7MMVfcX641TI7eNeX76yIZ6Sjb/UIJbUpmTU+Bb/vIgcsquws4c
	KItQmJS3hCr9q+NEKqs3I5LpaTzyJOzXXXaMlf8Fw4zt6KhSa0lLIq5XORzHiJ2xLYuHFyTWufw
	JPoxM7IAzG2MxMBST6WZGtdjSA7wBu7EQg0PaVGg==
X-Google-Smtp-Source: AGHT+IEOb634vvv5anrP4Qamt5Nt7XNTdNy2uVPkt2EgZKDhupc1JDlT7RMlX+E2/eHdl4lzW1cOlg==
X-Received: by 2002:a05:6102:3f52:b0:5be:d04d:d2c6 with SMTP id ada2fe7eead31-5d7dd423a07mr7808611137.9.1761221265657;
        Thu, 23 Oct 2025 05:07:45 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c7c93b7sm780767137.4.2025.10.23.05.07.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 05:07:45 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-932bced8519so557885241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 05:07:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSu+VUDGPcOuMuZCZo4QcWnnVEKEV79zoZV9sqlp1GMZEJU+vrRNmQ4lNZWR0iSzMyA9vs/opnef0lGuvil3CQeg==@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:5db:27e9:934a with SMTP id
 ada2fe7eead31-5db27e997aemr1516331137.42.1761221265052; Thu, 23 Oct 2025
 05:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87h5wsa3h5.wl-kuninori.morimoto.gx@renesas.com> <87ecrwa3fj.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ecrwa3fj.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 14:07:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuyDSS+zhQV69MK_SXfDpJRrKYvxsdgB8Qvuz+Q8770Q@mail.gmail.com>
X-Gm-Features: AS18NWCv1q8YpauasJP8nKtI5LMvjuBV_rVOoXFhH4VLXbtRUw8eyo-JmHWN1v8
Message-ID: <CAMuHMdVuyDSS+zhQV69MK_SXfDpJRrKYvxsdgB8Qvuz+Q8770Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: renesas: R8A78000: Add initial
 Ironhide support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 06:18, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>
> Add the initial support for Renesas X5H Ironhide board.
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

