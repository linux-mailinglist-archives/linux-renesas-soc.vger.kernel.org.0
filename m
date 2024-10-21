Return-Path: <linux-renesas-soc+bounces-9945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D12D29A6BDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 16:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CC34B21F48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 14:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745DA1F4715;
	Mon, 21 Oct 2024 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv3o7Rbd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1D31E9088;
	Mon, 21 Oct 2024 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729519857; cv=none; b=WjLVTPkcycL1fJwqMVVRGTE20qWoaJz64XcVBOEh9Tj2V9bQsP/zXPsOQV7GG2EKMfwZ7all8RfZkCFz/sHRoaL/p4uX1Gjud1AIVi092l515JiXETD5zW3COzrsxGaEAnZ5YiysUo+TdASuTDwdqoTkw2w+iHwv8RcpUwqq0Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729519857; c=relaxed/simple;
	bh=ywPxwrQ3WMCAWOXBI+Iovk6vz3ND8BMHXIVu/d9A7Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7Re8NRnRCfHRU6GMvIZXNF4X46Q7KahvBGOQC2RefPZcbczkEUJpmEb3U19CR89qNhdORzj6eCGXqPA+9WvQanC5sq9j8PCwRlX8NeKsW5afO6ADMeF7J5lWp4dzWcr87Hg7JFElglX2o2U/AiwX2Va9EFNTvIRvPoxmIG7svY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cv3o7Rbd; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e6c754bdso4335403e87.2;
        Mon, 21 Oct 2024 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729519853; x=1730124653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iv9JIm7M2nlW6QHznXyOtj86osaLzEdLfgINuaCED0o=;
        b=cv3o7RbdH5RamjQSxmccQ9VdbDjoRkyieO5jbrtd9HTHmB2EASE9YMyh0afkNFSz9Q
         WYG4bt2SaAkI5XG8BAVtvyjG0laeycsSZE7FUJFieQRfoe9tzaxoEz+7c+CKZ82lE24h
         vrvIFpQbWj/9BWp6Gv4oLxZyQVopJ4Qc9nxVjcCNsvzyh714cGGcWHoYpCyIEdqKoEna
         DY+5M8QjvYNE/UvL9oEbb8ROl5JN5qtCgCOVEWxYcmBTIgiN4A1/Jzf/S4AJFgigzaPc
         J8yzce4wOQw76JNzYnmoPX1LwQ9akDxb3azTOK4YlTuKhl10daw2jaOPde5NMZiC1sty
         EcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729519853; x=1730124653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv9JIm7M2nlW6QHznXyOtj86osaLzEdLfgINuaCED0o=;
        b=GZlfcne2Nb7d0ZLlB2UHATUa9zD8vUeGFcZcfXyfotkdrBjBmyyy03s/RGPtX+hxw2
         isQ5pC30sNhFSZbhPXDrErZt4DFJup1A0zs+GeyIaq/TvafrGY6HKHamkpehnIC7/5qr
         lQt4tX8gMn5Y7RDCZn133Kbhc0IGJ4aNbaGf1NDgxapSNU0/XDP+ObHhzOVmOrUaAqLx
         KCI3e/iQBf6zEJeXE1XCCglimcYrkDllft/JzvPextA0nqPxy+kKvsryF+2u8gNjoMAS
         kBGp8mpCy6GVl+pxl65uJxL0KGgVZ41tY4zL71aLkFS/is3CgwiTPbhJXWgF7ryxZTqp
         XGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdHO52kcite4XfYz4sheUke/pKgLLtr8cJhEBGbL8X255adis8RRPJB/mkDx1a8DjCk8BccBHNmNoFiILa@vger.kernel.org, AJvYcCVACTx7gv2fgi7zAZcMISDCJBoR2DGdVxy18m8MscwyokacfPoOoBHHrn34cLZXNJPwUstgyWZbm1k=@vger.kernel.org, AJvYcCWgG1wgA/t92I2/ka0Wycf8F940b31f2QiSNRtdhq6aaafReugWzQo1f7VuNL4Z6AHjAkdl36KFJHo=@vger.kernel.org, AJvYcCXr4efLNuv52a66uCIxyrYNda1zAE6S2bAQWnqH/9mqiebgsH39XwicHF2WOzm/DtHl9TGl2Mxk@vger.kernel.org
X-Gm-Message-State: AOJu0YyoEBVEBFDwK/UD0xRcilqi9CP4F9ekbL8smNzaTJCcBZPE9M7k
	XfpDQLIgd8trjW1ElfN8bRB000gSXbzu1TBbEsLenXLd6jHhNZ2/
X-Google-Smtp-Source: AGHT+IFbMOYW8mIYZdgTyVvEF4hCBFDSD2rXlBWz4xlZGRwXWxzGa7WFqQ1JnKXCjVtq6ut+LZDx9Q==
X-Received: by 2002:a05:6512:39cd:b0:535:699b:b076 with SMTP id 2adb3069b0e04-53a15467b88mr6259027e87.16.1729519853059;
        Mon, 21 Oct 2024 07:10:53 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4321:8ef5:e514:855b:c891:f732? ([2a00:1fa0:4321:8ef5:e514:855b:c891:f732])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223f0007sm491492e87.91.2024.10.21.07.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 07:10:51 -0700 (PDT)
Message-ID: <45ec2815-274f-4da6-8257-290fa7a4a642@gmail.com>
Date: Mon, 21 Oct 2024 17:10:49 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC] MAINTAINERS: Re-add cancelled Renesas driver sections
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/24 2:56 PM, Geert Uytterhoeven wrote:

> Removing full driver sections also removed mailing list entries, causing
> submitters of future patches to forget CCing these mailing lists.
> 
> Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")

   It looks like nobody had seen this one before merging... :-/

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

   Thank you for informing me of the situation and fixing up Greg's patch!

> ---
> Anyone who wants to take over maintenance for these drivers?

   I could use my Gmail address again (I did use it back in 2020 for some time)
but looking at the removed Baikal entries, this probably is not going to fly...
   BTW, OMP is not interested in the Renesas drivers or the PATA drivers
themselves; they were interested in hiring an official maintainer/reviewer
like me... :-)

[...]
MBR, Sergey


