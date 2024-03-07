Return-Path: <linux-renesas-soc+bounces-3539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F16874CE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 12:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF651F22EF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 11:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1950B128378;
	Thu,  7 Mar 2024 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uyg9+0AH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954591E52A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Mar 2024 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709809388; cv=none; b=Xb8ieDmINrLC0up48FOZQGYcqTdBgt8aVc+DDzmwe2E3afpEGeTafkylrdM4BSCzms3rHoUXfpk7177FH3gJuACKuPEC21BKV0M2e10fc38kArwuBClay9kC5iG94iBLQvGilcM8I9ZMSWQ6d91opSZXEtNhjg1pEXppf0nosXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709809388; c=relaxed/simple;
	bh=nlNivs7rD5YJwH04Lk714LzjEUSuotnGi/sybNgRJQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VBl2ZYYAhAVxPnXiJyi+LgWBtcPUBUtMU9JWyy1eVWVtRYRpNM/2q9/A8JZ6uAHdHNqe/VxzjFty+BfbEokBrpx7MBxONWTIYLCI0Ug7BqJ4fIkIMuG80teOTVZaGGomOVMT9cxqaL0ktmEatJqET+fdCtd6N5Yjixmy1Ywo0ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uyg9+0AH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a449c5411e1so99300966b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2024 03:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709809382; x=1710414182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqolVEWIRy6yFR+kt3iidNkcLmT4T2SqJQf6i9fsoSY=;
        b=uyg9+0AHttvsg6YdBqwkIW1eMI4IYprxsRMucD7H9bQMfEKwphj3oSzKLUBzqSLyQm
         fEfP7JYxnohTPYkQS5ChRMnodGdzzcbBM/fC+k76FPkIPI+/7QuVBRrb8bkGV12AGGnN
         E3xbLI+/Dc23Az9tEYig+NJpNWESfpbdLy/2e3uzcStO8WQWlcxkIGk+i0chcqVKWs6N
         NJVHjlCekCrKKnWnAeD63t7ToILw6ahipCbYKqnbV+8Cqys+SD2lNY07WIAbJQOf03Xp
         Buahon0+u4fUeFlXmoo1DbwGBqqT2sh2VlZ2iYglBmklnYuO4i9GuaAgCuFg40aXWBS9
         8iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709809382; x=1710414182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqolVEWIRy6yFR+kt3iidNkcLmT4T2SqJQf6i9fsoSY=;
        b=MQM8mj1TAKfm7p2PcY2UFxq16tz3bjhscOhIHq+pqVd9IhQXq531GIyCOdrFzLG5zE
         0MaiAUqrQGxs+2qVPpAGqnD2wqLqGpcwmcbP5ju0aw/m20dEg4adz47CvkgnKInG6eSY
         Ue6vxTuZjTP29CAOwqyyTTCBAcbJKpSTc2zV0obYG+eVra4dwoOuS9JcR+Ql4gw2nWph
         +Wnn6FP833Nj+dLiylakde+0MZQvSbRLVHfU9ZRcJWmiiuaGRXtbqHneHQD8SOBHoxUM
         DfGvYGloCqrHovRilwnZQLx7TtBgGtLLojBrWsn9o4CIgH1uVeoA/axifQy5qVYeiHMM
         fEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXylfoIo6we4OeYqEgGqRG/886wmOEp+NW8m9tgvJ1VsC2xlGnYOZ1P1iD5OsKHEHoPWiau1bg2h7cnhih/2FGYqHoPp8l2Xk3oAB/EZJ8987c=
X-Gm-Message-State: AOJu0YwdyepTNALouGTHyHfpemNiK2MBoMJ/alMTth35gQxFNtqFgZdu
	6bTgF5PetSviuFmLwbSVKDni4ZngmuAvVOMInkhmjFc1x8pvZjY3rfQbPlpQcOM=
X-Google-Smtp-Source: AGHT+IE5EE4EODozLFWVd8Zgtsy0SYU4E84Y2pBElKsn64AnmsFtrHgnEw9kdau7NOus+fecutqW3w==
X-Received: by 2002:a17:906:2754:b0:a45:ab61:7a47 with SMTP id a20-20020a170906275400b00a45ab617a47mr4284482ejd.16.1709809381816;
        Thu, 07 Mar 2024 03:03:01 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id md20-20020a170906ae9400b00a45c3a3390esm1167188ejb.200.2024.03.07.03.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:03:01 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] thermal: rcar_gen3: Use temperature approximation from datasheet
Date: Thu,  7 Mar 2024 12:02:13 +0100
Message-ID: <20240307110216.2962918-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

When the driver was first added the temperature approximation was 
reversed engineered from an out-of-tree driver as the datasheets of the 
time did not contain this information. Recent datasheets, both Gen3 and 
Gen4, now contains this information.

This series changes the temperature approximation formula to match 
what's described in the datasheets. It has been tested on both Gen3 and 
Gen4 with minimal changes in temperatures reported.

Patch 1 is a cleanup making the scope of a constant more clear. Patch 3 
increases the granularity of the readout to 1 decimal to match recent 
datasheets. While Patch 2 is the real work changing the approximation 
formula.

Niklas Söderlund (3):
  thermal: rcar_gen3: Move Tj_T storage to shared private data
  thermal: rcar_gen3: Update temperature approximation calculation
  thermal: rcar_gen3: Increase granularity of readings

 drivers/thermal/rcar_gen3_thermal.c | 144 ++++++++++++++++------------
 1 file changed, 81 insertions(+), 63 deletions(-)

-- 
2.44.0


