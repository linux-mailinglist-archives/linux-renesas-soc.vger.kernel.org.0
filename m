Return-Path: <linux-renesas-soc+bounces-9037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20627985441
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 09:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA5201F223AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 07:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E900156F36;
	Wed, 25 Sep 2024 07:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6MhwSd/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3E014B950;
	Wed, 25 Sep 2024 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727249759; cv=none; b=eMzpZLUnusF8sipxf195CS9HIIDvfJDSOWY6eg4ASjMI/y6T6JeoenXJT3Tom1PDXAfmPczCo0nHCc16KqQFP6xWu+WKo7OlEPzEXiBXx+0XQglXvE7kWRs5mOueZ3WEsleNuyY9Ds7Idz9uSSWFvYFWH5DNNQJJZFtKVMwBYec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727249759; c=relaxed/simple;
	bh=USUYbWyFPG5JrzT+4LR4s+GF4joINRsPNm+PkN+bRAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVSjnSZQ0OwA6YzBpY7UPeAYuKOjbY43UhWrBNeykg4Fal6Twp2yI2K6EITOdTW7Ueyr1FsUB8vktt71IHbE3+Rm0wtR7di7uBUtMpE9QFNlcqvvpaTzCmWQr/3RifXHbvcGVZpHlgzQjHWnn/ZANoVeoXVHIZavzSrM3PjUTeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6MhwSd/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95163C4CEC6;
	Wed, 25 Sep 2024 07:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727249758;
	bh=USUYbWyFPG5JrzT+4LR4s+GF4joINRsPNm+PkN+bRAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6MhwSd/R0Ji5fjZ/+tzxtvyI7ZNcqi2/mXlKRLyFFbJr42y1UomjkcjjJPf262+X
	 Ig28OW6pX+MX2tSGrZ/4YfAwyLHslnrFGf3QoSQ2VWUxpSqYzjDiGo/elh01Ym2AIp
	 VYMgjMhUEErrlVTQA8aEQa4VKuYbsAZwdzCaRW2goZibAccpvh6fSp5XWaP/3ARA4+
	 neAS8qbJuwwkzY4I8JbqA2sOIxRAPHCGc2gvfA5/WjsAU5SipQ7Vm42rviba+BPoOq
	 S95L/vYVHk0emjZzfmE1Kgg/qSrHuqYhZ0Bne/aITR4HOGOWtibvRvo1ka8vPLj4AD
	 z7aQO5wstVlCg==
Date: Wed, 25 Sep 2024 09:35:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Cc: patrick@stwcx.xyz, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 0/2] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Message-ID: <e2sceba6setxuvm5ztygqo5eoihjbts7gl4pfewjunepfhllhq@oblkbeb4wfym>
References: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com>

On Wed, Sep 25, 2024 at 11:11:26AM +0800, Yikai Tsai wrote:
> Driver for Renesas ISL28022 power monitor chip.
> Found e.g. on Ubiquiti Edgerouter ER-6P
> 
> v7: review comments and code refactoring

What exactly happened? That's too vague.

Best regards,
Krzysztof


