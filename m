Return-Path: <linux-renesas-soc+bounces-14045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3328A54204
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 06:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 466C27A7DE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 05:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E607B199FB2;
	Thu,  6 Mar 2025 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7JgQE1c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2153119CC34;
	Thu,  6 Mar 2025 05:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741238351; cv=none; b=oA/0G+UY9Uec6rsV5tepC+noIkZt+ZNroT4tgSkdD2bMeYTNfCAlTWCsimuMBpGp+LMy4AAxSv7tdoB0ecygpxXaMFl7yB/G2RAxRtcdKyNCRaJavRulrdKrkI2Sz8VW3wZRf1iZXmxQqh/AGpW0HrMExZh3FgZhmmMeXGn7G6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741238351; c=relaxed/simple;
	bh=GBhGJQFVUp0DBFSgOeX2s/lBWXZsL6lcQdlBxwYdn+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McfRFsZemi/5BHVsru61Aa9kjWQkP6O/Bw8+HRz9SXqVtwd2odcroiJ4cZI+YdcL8ErI+AItmX7O8jTQtXs4uBTUxjIAtBzDoK/PAP0SyD4qv/PTNStnIW5ennRnHLgnKKCMGm5+g0S7xfaMxU9K0kJSE21zlY8vji5wOkAVBRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7JgQE1c; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22401f4d35aso3412965ad.2;
        Wed, 05 Mar 2025 21:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741238349; x=1741843149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJtwMe1X/zUAgfEFzqCMQ1vGgIM46WDrkgUgbvwlPwM=;
        b=D7JgQE1cJT5V9AiKugphDS/aSgy02WbODB209KZNGp9H2VET9atNdgrmdgLym3myRE
         z6FbuCmPYiDJzc3DxKdv1jSJh/dDO/skxhkjifAnIrcQvgxTzlbzVzxb28HX6TPr4Iko
         YcrBshqcEz17k+DkYwAU2dQf71tqun+bs6V1EY2CvXfCQSI3THWzAIQ8dCWzSENyvyLa
         ABbXWFOTPNl4w+ax3WpC+Aq15tmbKM+Jb5wGWQR7H24ipfRhK856bzP6EHer2fc32EdV
         /lINhJGZStUvYm5zL3Gcdoxu6qOY/m1662NSGlPN42v6eOWkl0cstXqSFuN+SMMVWQ7G
         wgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741238349; x=1741843149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJtwMe1X/zUAgfEFzqCMQ1vGgIM46WDrkgUgbvwlPwM=;
        b=R7VGde1NaMJJbcdFkGhuejRsNOji4f6wSPWUQBTWBBWyLlyV3aywT9mZVgi/kDJG9A
         sToeV+tgCQvbGS4SLAn44aflDhMq7zRJGiEuM4FlYqPXeIQtdDo5H14WNj3blee5wfic
         x3FaufrSfed5cXXKxZSfNIT5Gb5NgSkKP/reetoXruGJizy3ApuOufF0R2zgZlqYzYmm
         lSASUhQBN0GC7M5IJjYCkpdLSl40tq3q4sWNeogOG1GfXpFEXwN+vQ1SdnKgeKeLHyMx
         EBpqPmjRA0oTyCw6c8Q/4AvxWpLMMjrIS3zbPuTJ2dUuprmSHG/w1SHZ4wKq1jOineLC
         Inug==
X-Forwarded-Encrypted: i=1; AJvYcCVTf6EMmW+foA29aHDGl1vSYtcLWLIq+PnJu7GVn8OktNmr/CT0cynQ+lnvjEJyJMe66GZmCtgx/9vLlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaaY4PAJYJo6xTbUqrLtFMimQ4Lao+2iSzrPnf40PNNqckr8xx
	ghFjQ3O9yC0DbJg5FcYJD6hu/oE3/4EPEjRZoBoNAa4v3mo8EFEh3cMPwA==
X-Gm-Gg: ASbGncuIinLM/OHyFWxdE/Ogr/+hFAwKQ13nhz/nqEVg+ESfkcDt3qN5JcN30GFo7vb
	d4LPoHjJjEgmLUKEpVLLeLKtCoTCt1n224JBX21QC0qiohRnruUTDYA8YrnusDF8A8YY4WBKZa7
	AsECNw3KgcDvWagSXN0u7XIVjYXaAgZA/mO/rZGt4cSOztElGCgvuZmsjCaJ5gqmmuzqa7r7Wpt
	qPZeGRvTFJkyvQUSCGxuHyPCR8GMWvoiGgoYFSAu6SYfsScik+kbSPFVMrad8c0GPfkimrm8Xk2
	tlAF/KV+Ng+2UEt5v+Ah1NDpbY7Jcu+8m5nBra8O1PGc3WFpLhY+Tqy6Lg==
X-Google-Smtp-Source: AGHT+IFKXqpkkRR9FL29DsIZ/ED4xOiePf6uTtoiIZYEaOB6o4yt1mfNjDoCD26ggh6AnUZDCETS9Q==
X-Received: by 2002:a05:6a00:170c:b0:736:3184:7fe8 with SMTP id d2e1a72fcca58-73682b54a53mr8560688b3a.2.1741238349063;
        Wed, 05 Mar 2025 21:19:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736984f725dsm392818b3a.95.2025.03.05.21.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 21:19:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Mar 2025 21:19:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFT v3] hwmon: (pt5161l) Use per-client debugfs entry
Message-ID: <25888f0b-bbd5-44bf-9c5d-406c3a469b3f@roeck-us.net>
References: <20250305123149.16990-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305123149.16990-2-wsa+renesas@sang-engineering.com>

On Wed, Mar 05, 2025 at 01:30:12PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v2: add 'client' as a parameter to the debugfs init
> function.
> 
> Sorry, sent an old version as v2 :(
> 
No worries.

I think this is safe enough to apply. Added to my hwmon-next branch.

Thanks,
Guenter

