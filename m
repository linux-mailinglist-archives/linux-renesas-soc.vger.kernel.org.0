Return-Path: <linux-renesas-soc+bounces-12753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D93A230A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 15:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21193A5EA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 14:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532FE1D88DB;
	Thu, 30 Jan 2025 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D037rpOI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF91DDD1;
	Thu, 30 Jan 2025 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248824; cv=none; b=OYrOk+xBQzvF65RmscJzKTmt1jHZdey9cH6enN0WOHmDMcNXU6s+cBCYIYkWlts6dLFECrO6LwKClFJDFw1pB73LwNDuNq0C+ubMkOq9vIF1ElVSEF/ojjRdBvWCfYuMN+DC+hQFcPPfkRbe2c6+fKqBqzFOb95yXo+RwC0Y7vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248824; c=relaxed/simple;
	bh=VomJynYZVgtByN55Kia6vShE5UBRZSBt0tnXWeshOXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Exb1sfL1B6lM5xSQFmHoOX7JnuzZt93KYxAIB1USWYbq60evyhU04FXYEr+C7A3Tgum0uReLX6UkQvjjJK/JHMuojhewkNO5rCswh4FPgzdlpGf+mHLMoaKQJ6HkespQXODgRpBqvuLN0GrGygeYwj+1Z7NIDiVbHn5SwZi2WU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D037rpOI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2167141dfa1so15529235ad.1;
        Thu, 30 Jan 2025 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738248821; x=1738853621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APWBmiSoVIWhI3giCYhH0tTl9BkjqOWRf4PzHM4xngU=;
        b=D037rpOImgYXQdda8UenhTJGk4lUfbq9CjZekgRPp0KG3m6IHBVKpkQ71ZbrkeEMU4
         ExD/wVtoS9p5I7M0GRcrdcFkIqLAs6qHXqQyQW+vZYqok7xPmGUbzT5XzvKmKqUaidKt
         1UVQmnpxW7O/mWGsmZaD+6CBDBfkGyucsKxvDkJiwXeJJYBuO6/UjupQYnpxG+mu5uVH
         M6fWpT4VCd7u3Sg6hjJMW9NB/dz0ITio+Tx/7tNF+o6biWEhiHMudVsnwc6Vf1klUk55
         t3i2RvQWsDyWcfeQ0szZ2g7E2cet8cJIRn3ZnCgU3V+diW2x730GlNfRRQd9WlR93Xch
         kFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248821; x=1738853621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APWBmiSoVIWhI3giCYhH0tTl9BkjqOWRf4PzHM4xngU=;
        b=JkpmyQnqx2dibspF1q8bSm6yqvnuql2DW2o3AWPL1ZpA7SWSgtDZaEbKNYV0o5Iqin
         5D/ZDHrSX9xIlNdDDqIuaBFwgYTI0yzv1+SWfNsGMJgGLhB7ir5t8609GXRISL4Ru/ZO
         a2iB+8BqnKBIGsZgOidmUqltkOzwoUdBs42VcaOQfssjCHH6Uv3GTlapQp+ofCHLDspA
         Xg0CMuEGfsWP5KlgF2VojItesPhf+ARemF1bMbAwFVsOaIb3AACD3dtq/JdnN6i6ycss
         g2/5GpZz3PAHS0/Z59bHyttiAVSL7uRPO8My3v+GXS+2+VbtFYSxWnIoj2nPgrMRFBrk
         np+w==
X-Forwarded-Encrypted: i=1; AJvYcCXXcYBwt0IhG7s2bzKd3rbPkw3iF8saSwoWtmZ2zXCo8uLki4WMkgdxjCKRK6qgJVjSazohzJueyGlUeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNp7j5gOhlywsnAZ5ce5diFK3UWcK7FqIz5Xq0obYrO7+9Db1q
	5zbtWV46dKT+CmUJDbeEp3jGlxd4/KcpRvDwgFBwIATDM/cs6S51
X-Gm-Gg: ASbGnctMsNT0ktNLYCKBgH/qUuqfO4Od/DQqWL/JSZ/ZomwCLNY1gMOCl/VytpjQiRL
	bD1aqNiNvmiadT1QXaw6t3rJk8Kjo5vkfy96F2l7OFJF9PzKZbmSSjLPKtzU3VZoDjCiMbTyAwl
	fJsWAR3SVN7JuJJEX7H82gXGaupefwWLJgB9DS5E96enAxzpHaudS/oql6YOIKssHh6/Ln3xkmX
	e6JQUiEJ9ylgfMUifpuOq/sfaeMpXpAy+N0TAviB5nQQMOJRvomg7ND/otAVn/BKc680xw7h4vb
	knr8ErZAq/Qb+uwcDe8opl6fesj6
X-Google-Smtp-Source: AGHT+IFtfK3fGs30HCdDUqmaSfDQJxovcGBimWayyOyms62X+lSX09ybYFn1tzX/Rg06UgILRTy6pA==
X-Received: by 2002:a05:6a21:910c:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-1ed872d5b3bmr6272998637.3.1738248821425;
        Thu, 30 Jan 2025 06:53:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0479887sm1435668a12.52.2025.01.30.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:53:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Jan 2025 06:53:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFT 3/6] hwmon: (pt5161l) Use per-client debugfs entry
Message-ID: <c7819e3e-8d39-4f1a-8d0e-73ca7a1b2ed4@roeck-us.net>
References: <20250125123941.36729-8-wsa+renesas@sang-engineering.com>
 <20250125123941.36729-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125123941.36729-11-wsa+renesas@sang-engineering.com>

On Sat, Jan 25, 2025 at 01:39:43PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
...
>  
> -static int pt5161l_init_debugfs(struct pt5161l_data *data)

Please keep this function instead of moving the code into
the probe function.

Thanks,
Guenter

