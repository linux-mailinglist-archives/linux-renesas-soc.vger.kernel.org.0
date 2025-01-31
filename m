Return-Path: <linux-renesas-soc+bounces-12796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B97A24066
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 17:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE8F73A2B8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 16:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866081E571B;
	Fri, 31 Jan 2025 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGo7BHJO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E270807;
	Fri, 31 Jan 2025 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340862; cv=none; b=n/yZ4lvZa/ChRAtk5K28zKFFYwNdVDwv2QceqTp4hJjA2FVdQX7zBe/wJ34giHP3P7e1igEUtPqEgQp6MEusT6vnyRARu999KqzviUksgLkA6kON8fUMrZuSizI9no2BeBceL1HYg8JrMBI8oJkp+X9ABgXWCPX7L6s0GxbbC0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340862; c=relaxed/simple;
	bh=9d8iz3atJ8SFmBq95SorE+zCnvCzuJ+4nJxphzpsd8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ir2lf3HTKHvFDiITrnsMhDUqUISvmxderzJkIINPMk/LEGZPQDVAG52kMm/sfnIF1R+mnX4KNcOAJPhzKQaQTZNaHl/OuDlhLhDa27BYf7liqYCwdPIx3x2pD2MVY1oRe43xSGF2Aakeliz7uAC/V8AiGbV6S+tmfVgfWFSkrx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGo7BHJO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-219f8263ae0so41960755ad.0;
        Fri, 31 Jan 2025 08:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738340860; x=1738945660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFPs3L8nL4rExUqip6npmMartw/p4+W7rTsGvL4C22E=;
        b=jGo7BHJOD+HCCGKXBQOcbmR/ng6fOZQl6X4cUnIXnKc44kCBpDrpYjaPM5vxJ0aTsE
         +McmCcvIwRwWyTalneildSK3tsco7glAQKaQ5Z/8L7ZidmtSsOevvZ0x8XfFdYIn/uiW
         N5o/WzbjAtrK85Jn0dbtkPw8TTxadI3wqkOPZE0C11DvsLZ27MXf+VpOOdpnsxwGJ7Wz
         QXPepSjrTjJktds/DPIWDX3t/zQS+Q5kGifgZFlcCDYLW548lt+L3nmHoc1Mvlzsxfrg
         MY/Xgf39yfmrf3ie1YDwb8bVUomUult/sjJuI01mKuiPYO9lH1P/V8SOY4Nnyce8Xois
         Eatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340860; x=1738945660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFPs3L8nL4rExUqip6npmMartw/p4+W7rTsGvL4C22E=;
        b=sceAPMlBKhAvvSXVBWA08ARtMmszibuDZQW8xNzzza3ZeZcijRoBSob7tCzF9TSkD8
         np0AyT2NJsRLiXJEpxiNpRhgPxmwfv174nciW+uN4slMJBm8YZoGJsub/YWCmZ9VkpYa
         TiJeVhhfweOFXAZOdOUpwGx9CshqO/qpue2VSgj1e+z8YSqXd1JSp6x0BM0oGaLGwKK6
         uqSgSbHOJixD1mGG3zKoPnYGjEskdJEhjiQVKtKBYJTg0zXEAaz5tuiiaYTPVJhYEkNv
         fT68sZku+W9l0cv9EzcvzA2qS+NLB6ntYEm/sRb5TVfgiUVurAmlSgNd3f0E1PVOqHa1
         WSOA==
X-Forwarded-Encrypted: i=1; AJvYcCV6HUz/KDEZU8QvwGFrZyqYqoKwGcfdpBg76QHWxv/+z8BhLjBg1uLTYp/d9AQ1bMstPjbn8JtUSoLkPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQHj67uMRsLSSf0keQeo1h6CFkvqdIyu40KB8Yi4oVDTisCeBh
	a8AuajVURUpdwHfm1/FCXtP1/v0O+OMlFtgXeHzRm+CI20inZPXI0ZLArw==
X-Gm-Gg: ASbGncscVP9Bx8JwfxAylblSf3iUhOcGCdfBYdXkZ6JmZMY5RaVssEuTmfEx5zczCRW
	gzGZBdfKSLjEtgYUDluj6OXiwDPEFmjzu9imhR/dFEmiXqnfGv8x/xfGLvg861XgowhRBiyMHWE
	GXAbsqizr4rPV/BVEs6eBlnc8QQwxaCcKwXCCZqkWt0qu7Z8ROhpMJMtK9GR/7MttKeFnNgIG36
	/ZrkXcIBKEEFQSw6pABk5cCTA4Gw/bnHiafezq586Xx+jPj6C67rUDIv7tDWmSpe9az8OhHIBd/
	38TVL9YCZGwShlbyOykGXE2hPZa7
X-Google-Smtp-Source: AGHT+IG/6Pk+E31jTp0ry9eFaDJMEDcSozZZv4x6t6eTxZjAfsaQL+9PbJl9fDiHp0A4taUyUF/UAQ==
X-Received: by 2002:a17:902:ea0e:b0:216:5e6e:68ae with SMTP id d9443c01a7336-21dd7d93709mr169379435ad.31.1738340859963;
        Fri, 31 Jan 2025 08:27:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f5f01sm32688425ad.71.2025.01.31.08.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:27:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 31 Jan 2025 08:27:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (sht3x) Use per-client debugfs entry
Message-ID: <3efd2cfb-3d09-48ea-843c-5a640c0fe7a2@roeck-us.net>
References: <20250131095148.11973-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131095148.11973-2-wsa+renesas@sang-engineering.com>

On Fri, Jan 31, 2025 at 10:38:33AM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to hwmon-next.

Thanks,
Guenter

