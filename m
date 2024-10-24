Return-Path: <linux-renesas-soc+bounces-10072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B3C9AEFF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 20:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79304B21E6D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 18:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8275215F71;
	Thu, 24 Oct 2024 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4QSI2jz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EBC215035;
	Thu, 24 Oct 2024 18:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729795955; cv=none; b=msAYkVkpPvpetwHs8bBNwygWqFmBZg0XJY/oydHV2be/x4gpGGaDj0klJ2fKOTp2PQSGdOF/ehkt+gfTt67Adpk49idZhc1h9szt+h1ps2I+a8ha5OC2v3GaScD1OEdcccabAnn4HMVpKgZyR7Wh0ZP/4N0yL9VVK1r4tLhQpU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729795955; c=relaxed/simple;
	bh=6rLVkYT85aPE762YWX/Qza6i4TLO/D+UE9Oy6vAHa5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyF57UW4V+e7wODmNYWzFry8e0cN5tfPfHdnBiF+I8V/Dh6XDBX+F+YE34I0mPnGgb0P6yrdUwu/JkQ/B4Y/xmbN2UzB3IppPs+Q2t3gnzImck+wxhsi1yLGdjj9NOA58JLNFB55Z+BMDwEbhs3b+aBN3Ncq8Ftb4LjHRFcKO9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4QSI2jz; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-539fe02c386so2378092e87.0;
        Thu, 24 Oct 2024 11:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729795951; x=1730400751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rLVkYT85aPE762YWX/Qza6i4TLO/D+UE9Oy6vAHa5Y=;
        b=B4QSI2jzVlrWa0/YYcbjD7sHVWDm1TRjjoO6LolI14vy9d55l9W4h8mCrIxyyIvrlc
         ufHj+qhMgEo61Ew8DZkfTHydpFxZyiyGT0kXzlB5ooR9xL/l5859SQ+GH50TbeEzN/5q
         jvSVEKjDcf+4pYUne8JKUYiuGkm/jccN5WFJKmbHefmqwT+CqoRmi3Fy5DYNKX6Z3HtH
         k8Da0DnPwJDrrpZIBMXzeYLuSzZttxcKDFQH61DwZHVmd9Y7xMdeH9r7Ph3pCcWd8BYM
         WHhLNhtFKwWvaxkOdbfhdF7SAEIEVio6ndoerHxqJt1ND6+IqmSkYl9iSJHGz8dL56mN
         Jj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729795951; x=1730400751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rLVkYT85aPE762YWX/Qza6i4TLO/D+UE9Oy6vAHa5Y=;
        b=paOiYBtj68Ka+vgsFc852p4nwuZwCQuIgPBbJ6Kf36Dpn6tTCv/L4gemFITT7t5guG
         JawPj2S9gr/vZXRSWnBR7KCUJWvV9H5SnK9QynAwBeBy2zXW94QKt1uXD+EBwRvKQc9k
         923QsJ2uV4Rs3MAOnsBIYvYwenrp4PDTlFD5mXpYflQQ4nX4OOtG7ARhQIF9oTdWhZDP
         K875B6pWFQdN/wkUpOOussBvKvkOrgXe3RDCU5nJiBrAV+bFZGimQF32SyyrxMJV2AFE
         f4Y8qq2qFMOVLR8FYcBFZiXDwmt0f5MTN8AIwdktGgv6PbAj8ovUBxThtXl2Pzc7o5DA
         ZooA==
X-Forwarded-Encrypted: i=1; AJvYcCUDBhbUisQy2OxFACuqbupRV5EWC1CwY5fccjBlo/eIbFiuB907Lz+fhMYYCtdcm5p9U9mlTNCPCxhiZg==@vger.kernel.org, AJvYcCVjvx0z2wPsPjJyU0UuBn7lNTQ/QzDV6WDxxr63FFqvlbvMW5rI/olwnTfU9U9JLDB7vWgFmQZE/Ts2DZQ=@vger.kernel.org, AJvYcCVkzHrMBp4E8WycTaCG65BsG4vSCNcQ7vHK9msjMD3HCur7NqvKVn9qBx9cMte87jKCqIqBo6Fd9yii@vger.kernel.org, AJvYcCVl4V7SQdPXGnBeRj7GG5nQpTLKDnkzsZdeSltq1CPOlo2LdJ1gnWJfoiBYt87Z89GezJJOHWGdgIyrY70=@vger.kernel.org, AJvYcCW7+KF8sV7XR1xtu/EOcuXVMPDVMAtVobpk52mtBCuKWQOtgHHfo97DrwDD4ygGmSQ+XbTbfYWo4mdIlcgMd+Qz3oY=@vger.kernel.org, AJvYcCWLsQlyDm2sJ68v3uQwuhe7flAVW1udyXX7SzqvTi/SywZEJkaJgYAOvxtQDTzt1jMDYnSmj3ub@vger.kernel.org, AJvYcCWjX0B+zlSGfx9TyWvE1flPFNuO/2I0OhGMJ/LS5IozzaIFNY9Kt1HYr5jDjjgIbzIyaw6MGXvkxt5m@vger.kernel.org, AJvYcCX7HKESgvHx2vzUjhGFsuoy3wNolDhAXN0+SiWg3kOFovd3Zs1MAJHNztvMYfzE0ij6gGGFngcX/lFu4s0=@vger.kernel.org, AJvYcCXL7sHj8Np6csS1CEET6moIftE4UgdCGNPVA0M198VH0hu1BNCBBGR2tv2leTk8u6CCQOdPUeyNzNtP6g==@vger.kernel.org, AJvYcCXdwY2Bcq1hj+/iicgo
 rK2JJAvgXM2qPOL1Ybl5nd4qDkycY3SePlEV0cuQ/F6ZgBUZ7FMdn3hrzFDm@vger.kernel.org, AJvYcCXuzZ0b04QoKIl3EYcPRtkHXf1TP2Z1CfL1A++0b6814pppLMtTg9KQngOX4FrsD3jJbQJHSrNymz4=@vger.kernel.org, AJvYcCXw9w1AtXsPwQegDNllJbX8dEYeMlyZxGhyC4NsSh9/FAEc7d1nsVFKgTWPHnURJnCExnzU8VditYmRsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xXdn1QoWGYrpJ4qHRrR9n54uQcg+tzW0pjRZRSNwQe+3n+qC
	YxowZdzsMinJoNYt8DV5YS67Td3NSaLOIFzMkwtMFFu7RFIQLeI6
X-Google-Smtp-Source: AGHT+IFkWRBrzeLKeEO+Np33CeOqrUjEkpcda9TFwdG6TPhN9sol3OtNiKha11YrHOpKi5PO23IACw==
X-Received: by 2002:a05:6512:138c:b0:539:fe02:c1fe with SMTP id 2adb3069b0e04-53b2371eb7amr1010071e87.16.1729795950886;
        Thu, 24 Oct 2024 11:52:30 -0700 (PDT)
Received: from localhost.localdomain ([176.106.245.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b13cb326fsm889624e87.54.2024.10.24.11.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:52:30 -0700 (PDT)
From: =?UTF-8?Q?Russian_Troll_Factory_No2333113724691862412370505314550?=
	=?UTF-8?Q?301522361658681972819097215937998212703204793632409614950580?=
	=?UTF-8?Q?711014116901113627315250812066331608136907483394686821870024?=
	=?UTF-8?Q?039451032206763651586662278212538418825116031124619343320237?=
	=?UTF-8?Q?170775164372533032517140881318832593184331007632587308251100?=
	=?UTF-8?Q?725375162262601265591575233753211727309251482024820297754324?=
	=?UTF-8?Q?831208163205732118230753038815492120832717323691311767837954?=
	=?UTF-8?Q?629979246463915142194013216092488125686168471778268401924711?=
	=?UTF-8?Q?558164371821728133247981839714403142659456290632688662816331?=
	=?UTF-8?Q?364145053184928586147979635141001172910318313111044726365285?=
	=?UTF-8?Q?259638996623464136342569322623274581973520594112612955499289?=
	=?UTF-8?Q?734280211482524728237242840982972292248641831020222182192508?=
	=?UTF-8?Q?457369794189381947216277137432118131508169930248288557653761?=
	=?UTF-8?Q?024157150545757210477177733251922494942668772781705231240118?=
	=?UTF-8?Q?191118518404175491631312956197201830832218173663057420174975?=
	=?UTF-8?Q?818813129371895630846172783924432453073641976014165108692261?=
	=?UTF-8?Q?103831673263803726148781941489012102140853073421746170732818?=
	=?UTF-8?Q?224180231942412948531742526332364154774311289531296346219831?=
	=?UTF-8?Q?456281831640413414267253173039110422118671723925093233214224?=
	=?UTF-8?Q?24082610610727276851001532673?= <vladimirputin693389@gmail.com>
To: torvalds@linux-foundation.org
Cc: aospan@netup.ru,
	conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org,
	dushistov@mail.ru,
	fancer.lancer@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru,
	jeffbai@aosc.io,
	kexybiscuit@aosc.io,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com,
	netdev@vger.kernel.org,
	nikita@trvn.ru,
	ntb@lists.linux.dev,
	patches@lists.linux.dev,
	richard.henderson@linaro.org,
	s.shtylyov@omp.ru,
	serjk@netup.ru,
	shc_work@mail.ru,
	torvic9@mailbox.org,
	tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru,
	wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com,
	xeb@mail.ru
Subject: LINUS TORVALDS IS A DICK
Date: Thu, 24 Oct 2024 21:52:22 +0300
Message-ID: <20241024185222.14273-1-vladimirputin693389@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
References: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi, the linux mailing list.
You have asked me for your opinion. I present my opinion to you:
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK
LINUS TORVALDS IS A DICK




