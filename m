Return-Path: <linux-renesas-soc+bounces-775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9E8070E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 14:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBA95B20B42
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F931381D7;
	Wed,  6 Dec 2023 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZA/Zmu/P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341A337156;
	Wed,  6 Dec 2023 13:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BEDC433C7;
	Wed,  6 Dec 2023 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701869299;
	bh=yhesIzATDO4OKYwmDYNzt3VwQxpPURRVsiQ5N4uF9JA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZA/Zmu/PCGtt14UyyxMI3C7VqmLniML0nD31PssOTkSNky1FI3+xd2j+fb+8cgzFy
	 2EbGV50p3J9IbirKmC+j3OijJKRgZiMv2H/0MyzIUAGnwOSFIIW8IQg6QpRpFxSwVk
	 iLy9H0xbC3lFd0InNJfMB+AhYz5VVdaoBthrjX2UXD6Qmr+0/DSQfN2EP0RFJYcaNB
	 CwcCKJzh9tu+w/5v/EUfC5ah/skqzv9ksiQdxasa/0Wmzln0TkfOWUwZ+diJsmVWy5
	 pY6nIk6GvSAi8ejavwodixQKZAciu6aYG6ywwgb3gwhv8VFczSdV9hNMSnzVtG5+L6
	 CTeNzXcWgjtJQ==
Date: Wed, 6 Dec 2023 13:28:13 +0000
From: Lee Jones <lee@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Support Opensource <support.opensource@diasemi.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Message-ID: <20231206132813.GC3375667@google.com>
References: <20231201110840.37408-5-biju.das.jz@bp.renesas.com>
 <202312061323.Zk81yCZU-lkp@intel.com>
 <TYVPR01MB11279FA6949EFAE62C70EB2948684A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYVPR01MB11279FA6949EFAE62C70EB2948684A@TYVPR01MB11279.jpnprd01.prod.outlook.com>

On Wed, 06 Dec 2023, Biju Das wrote:

> Hi kernel test robot,
> 
> > -----Original Message-----
> > From: kernel test robot <lkp@intel.com>
> > Subject: Re: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
> > 
> > Hi Biju,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> Warning: Documentation/devicetree/bindings/input/da9062-onkey.txt
> > >> references a file that doesn't exist:
> > >> Documentation/devicetree/bindings/mfd/da9062.txt
> > >> Warning: Documentation/devicetree/bindings/thermal/da9062-thermal.txt
> > >> references a file that doesn't exist:
> > >> Documentation/devicetree/bindings/mfd/da9062.txt
> > 
> 
> There is an updated patch series available[1] and Please retest and
> provide feedback if any?

Do you often find yourself chatting with inanimate/automated services? :)

-- 
Lee Jones [李琼斯]

