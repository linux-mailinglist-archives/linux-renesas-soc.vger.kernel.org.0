Return-Path: <linux-renesas-soc+bounces-17436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A3EAC229D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 14:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF763161CE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 12:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA6D23906A;
	Fri, 23 May 2025 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linatsea.fr header.i=@linatsea.fr header.b="LJV2CvF7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92C4224243;
	Fri, 23 May 2025 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748003250; cv=none; b=lz4f/IRstxhBXNyFD2w1CFCkErNPignoYKl3iwQZ29blMgPjWL22xK3vfmhQ10j8ewR/VjxVlvjVWagTTEGXTK20IYlv8CWf2WriBOfHswes1bk/OfdeYond+i3iXXiFUJB1Hi0AnozjX+WWXJrEgm0wkwflu99v5oKwHAHN5PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748003250; c=relaxed/simple;
	bh=JdO/dPdW+F+54b8avPhxVN0wFwoWsH9tVBJgWhLKQvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nEQGlyGhQbs2mmLeS5ZQwy+gkl1zMLEsMGtlcRqBQ/SgN2gbEByZ1RuuUWUgPGn1R3WDfL5PNSkE/AiNX77SoNaiQiMmqy5Z4uvaLBJMwlEXtQ0CTszSJdjZOb/YO7lU47qJrFa023efFA1MO3xJcHyGMwWgQdr88jZWJ0nM3fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linatsea.fr; spf=pass smtp.mailfrom=linatsea.fr; dkim=pass (2048-bit key) header.d=linatsea.fr header.i=@linatsea.fr header.b=LJV2CvF7; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linatsea.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linatsea.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C5361FCF1;
	Fri, 23 May 2025 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
	t=1748003240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5PS/ipCRnGeBihiPh8GRYydPrjqJQQ7OjygoBxNsSw=;
	b=LJV2CvF75rS12XWN+8wzsIIJAWjGVMWA6zD2raMivmUHfj2lI0P2K3xFEbHp4eLQKyofsG
	N6VSm9jaWDO4NbG5HI0JonY4CZ1FgALFwCC21YDsmslSG4E19errSRQ8jqdXeY0W/yBGJP
	DAzK3rbmxHHU+dpPgM3oglaxkMji1lpHbWrXM0Xvh6rwkWavFQzIW+NoYl3BzO78+XTgF9
	FP+Q5o7uT/6RrJs8TO9/9fYNiG22u7v4s2hFQhqKzSUaw4NCGS0DFJeEGE4IvuGjZrEqEU
	FXltzGt91dvfRi+Ai5JpbocAFHVoKb/Jq6nhJJtBTSn4b+nUNFAtbJw957gzyw==
Message-ID: <4b9e63e8-388e-4b24-98dd-05bd9e73731f@linatsea.fr>
Date: Fri, 23 May 2025 14:27:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/10] serial: sh-sci: Use private port ID
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-renesas-soc@vger.kernel.org, paul.barker.ct@bp.renesas.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
 <20250515141828.43444-7-thierry.bultel.yh@bp.renesas.com>
 <aC2yYDpsv7ef9IVA@shikoro>
 <CAMuHMdVPn3adKZMiLqoEz9ANNyekmB9WRFyz++49+FeEOkrSSA@mail.gmail.com>
 <aDBoLr-uPxxHgzEU@ninjato>
Content-Language: fr
From: Thierry Bultel <thierry.bultel@linatsea.fr>
In-Reply-To: <aDBoLr-uPxxHgzEU@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekkeehucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefvhhhivghrrhihuceuuhhlthgvlhcuoehthhhivghrrhihrdgsuhhlthgvlheslhhinhgrthhsvggrrdhfrheqnecuggftrfgrthhtvghrnhepffefueektdefueeihfdtkeehkeetgfejfffgtdehjeejtdefhfetkefhfeffleefnecukfhppeekledrvdegkedrjeeirdejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekledrvdegkedrjeeirdejtddphhgvlhhopegludelvddrudeikedrheejrdeljegnpdhmrghilhhfrhhomhepthhhihgvrhhrhidrsghulhhtvghlsehlihhnrghtshgvrgdrfhhrpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrsggrrhhkvghrrdgtthessghpr
 dhrvghnvghsrghsrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshgvrhhirghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thierry.bultel@linatsea.fr

Hi Wolfram,
thanks for you review

Le 23/05/2025 à 14:21, Wolfram Sang a écrit :
> 
>> Actually I asked Thierry to use bit 7, so both type and regtype can
>> fit in the existing hole in struct sci_port.
> 
> Okay. I looked at older series to see if this was already an agreement
> but I obviously did not find this part.
> 
>> and 128 can be changed easily when the need ever arises?
> 
> Yes, this was my motivation as well. Easy to modify if somewhen a need
> might arise.

but is this something wanted now in PATCH v10 or can this be in a later 
patch ?


