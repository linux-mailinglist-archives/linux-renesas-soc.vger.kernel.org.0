Return-Path: <linux-renesas-soc+bounces-11686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 180799FA733
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 18:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49C941886660
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 17:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C47918FC80;
	Sun, 22 Dec 2024 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/pzMVYH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79F27DA8C;
	Sun, 22 Dec 2024 17:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734888094; cv=none; b=bqLrlQ98KQUiMUpabs6C/wAa9+JnKshlU9VxxD8JpTjlVIXx6SR30dS3wV7sx0Lekcvm/D6ySMfRFbsiQV5hKAEr9E0eDdDIIbhmUPS5UBMKSb9rSgx63P3yBrEOcH0Q7FzE2QoSIP/9c/cYRf3IqepAEiI8/KopdlUpA+jzrRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734888094; c=relaxed/simple;
	bh=O/q9mFAQPoK9LjdOUkvHQ6flBKTkXM9V9yKGPNL7+Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+hDxZlSOQBt3T8konqcRIKgTfKJE5F+o5g7/6Hq1DkxRwTTBw0SzaWsuwW/qzbCtSoKijAsMdVdemqCWTYBLNhE07hLJwiiT7pUWTtvnn7eyzIoX2bJM8XeSxDHZ6HMRUkT3ddkfEg0wEKUgq7K6+TX2PgzQQZyiBEQ8gK5un0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/pzMVYH; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-728e729562fso2811977b3a.0;
        Sun, 22 Dec 2024 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734888092; x=1735492892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwX7ZKPnffAVRvpfMPGhYikQQlC21l3tTkcLN/cQpxY=;
        b=Y/pzMVYHND3Qitiqqr/Cg7ktYIWHiDjk250+gM097gUtLFeXxIvwyQfU4hD92Zj3/9
         Odv+b0JbViUieZd6frdmxBm/v89KCW9l70TslIjA8T0GQ2msBtEyZmkFwW0N+MC2NSKT
         jc6wWCYaW2CEkO0JC9fKKf41pn1qWDwKWiLfskKB+8vLV+pQRFeVLa4NdmJK02INds4h
         BNkA7j1IXAV7Dll0pybTwZxw6huSOgCaoMHBPNAfC5GJLvNhW95zQ6lCmOCEYx1m948/
         otEPSwnbNK4cdD1S+KYID5Igco1F0G1WEQJiq5+9B9StOL7rQN0x9uwAIKx2a97BYIc6
         MkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888092; x=1735492892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwX7ZKPnffAVRvpfMPGhYikQQlC21l3tTkcLN/cQpxY=;
        b=SOyskP/qJJsJGvLTemQhfM+3ZIYDvinsiVwUrgGAr0mP8Pz/elteBCB/S2u7RC8LFr
         S63bJ8psuQEazU3l1gcL3X9Bb1i9nRVJmtQpEvTBomCvUuWkm05v5c+DHtOPT8n4asD+
         TSHgwE1+GyGutiXsobbaazwC3dZhdhD//aU+OQl2SnZyGQbs2lU9vpimcbAskKzo9Za/
         ETmuuj5vfrRYIh8o1186VnoqkK/x1C+ztid/HRjg5OwqsllFPb5otgXkNNGGb+p+Ec0B
         oy2lUNiGJkYNONGdT4TTUmcEpusIogKkQsW6Orjvjo45dUATX1bChjndvPL0qjdynk+t
         4FzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuKBwLmTxgUmJyxPnGK5EW67ojXH8xNTaPuAXUHpS819EDczkVR3eJnCHGVfzUsu6YdtYSkymNCdG2Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXphZH1xcptEZmCgoDswd0h19tz521teOTmeLr43g/+/7M8DgU
	L2XTmbdqkINcbfF898/yD1NkNFCfkepSxOEc4joLlouIyJiYmhGQ/QClAg==
X-Gm-Gg: ASbGncsAmKpa91MEYhHwXeHChyf0O7IUoKA+cc2kLtJ0leYbCWD6xIWYJ8hL+2/qA8u
	5+c5lUwx4B+1uQ43snc/LYmzV+LN8NtCsuU3RGN1P3imJc/mO28sgdoDrFPCqU4Ds2MySM9R+09
	DHYf16zf2/2vrVXrK2oYzDn5uz/ff/Z5R7ZdHk0Jqmc/dWmPd1njl1m8H9Pr6IN9I8O2GSAZyVA
	YnTNd3wjyrseQE/ekGb7BcrPnL06gCU/T4iW5kXik4IUsaj9Vg+uwS4E3jKO6H8AC6SDA==
X-Google-Smtp-Source: AGHT+IG4pveqxGdLPEokGo5SUlL8C9+veHedBBa0WZCo4TMVxnpvRu/wHu40m373r4bb3OislWlqnA==
X-Received: by 2002:a05:6a00:8d1:b0:725:df1a:281 with SMTP id d2e1a72fcca58-72abdda0cf3mr11797829b3a.10.1734888091882;
        Sun, 22 Dec 2024 09:21:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb7dbsm6325854b3a.133.2024.12.22.09.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:21:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Dec 2024 09:21:29 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH v2] hwmon: (lm75) add I3C support for P3T1755
Message-ID: <1acf15a2-501a-4441-8cd9-74057132e7b2@roeck-us.net>
References: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>

On Fri, Dec 20, 2024 at 10:36:34AM +0100, Wolfram Sang wrote:
> Introduce I3C support by defining I3C accessors for regmap and
> implementing an I3C driver. Enable I3C for the NXP P3T1755.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied. Pleasew send a follow-up patch to change the endianness conversion
if so desired.

Thanks,
Guenter

