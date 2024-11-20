Return-Path: <linux-renesas-soc+bounces-10641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD79D3EB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 16:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381082813F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 15:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CF81C1F0B;
	Wed, 20 Nov 2024 15:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te10CrgT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5205E1A9B3B;
	Wed, 20 Nov 2024 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732115011; cv=none; b=uw8pTTT527D/S36Vq7PHq3oaHSwAK2Jxi/I9Lbl3qo2sV22TlzT+hTF6gV5cJ4vxv7xf8/RSqgs67MtjmLXKLbJKytrHpq2q7UiHDUc+6JsuHta0XMaItVGTllWneA8pS2XD9vFs5JVL+Uje2whWGjDVr+Ae7E+6HtA602ep36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732115011; c=relaxed/simple;
	bh=dqi/7Y/5vqnK735gTVWKtScHAGuc8EoDAdnnSptK3rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSg8rLQ9dM4hvSQVxewcnBq5j6VxwAA6EzUEyKQri8t5LgnfHlsdiIk0MRknUF8QUMtZwWy2SDQX6dGy+N9dX/OeG0sDELeG4aEITGeQNGpts7D5eH/w1KWGqPGi3gpwW5NHz0ZnDILoYnJQJa+LOAxMYwR6ayC0HbVvqp1o+3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Te10CrgT; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7edb6879196so1658826a12.3;
        Wed, 20 Nov 2024 07:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732115009; x=1732719809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEu8uOzlG6eyZ2h9eHSBpdbchV8xscDCROkv96eRgu0=;
        b=Te10CrgTgoMQPdiO0b8J4romIaFtOYCJ3uDPbZq5YAZL7iccKsnXxSuL/pTxHy7TJr
         nGme9RjVgJZz9/eH9Qt9ccsDyqyKGzmxeXcOHpQ7yZa9tKhudLRK+ZFvYGQBgf3qPrkT
         PgZAu/5mnn823RFr2NWmm/wlgk7ucakPcPsYzn9e7FzE1FU6w9NdTi61szDSdX6xrifG
         Iy2UTJ2wKUou6nhVbaSImcxqi/vpF14iz5bPMQ6RTMV8SFCBjXBNTNLQ/0quLkZ3Tbqa
         ZPFNjr2/X59SodV3neN6qZVTrzu/sh245KUneVxLep+3HtXQiSIi24SsCHKMP14ywQQ+
         xCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732115009; x=1732719809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEu8uOzlG6eyZ2h9eHSBpdbchV8xscDCROkv96eRgu0=;
        b=G24FC9gkSC2kJ4DOmkO9UVKC63MNL3Eevq6Rjn8ZhK23zRBaGX1z7mjHFwEuga7vN/
         iC0zbw6bhyCNw4DNq0JpMYQ278eeyJP8nsE6tw292xmZtDNIcQweegFiSZkSHuPSV6Nv
         hmzmtcv/iMrqedZXl/f44eK+qQAi19mvU16r88rV/eMEQwLUOGOq8ZtXi/Ddajs9x0lL
         jtjGzx+UxodPNr0AapIFvXrOvJtMSPBjB2lYB6lX+DGMp7tUJHJvWAdBO/2UAm6Kc5hg
         gvVYEzw5/2npuS2SVnxhjZTfVVU6NlvpnkXj4W4qhbWZPwEE8TbYr7q9HiKV8KYMd5Fc
         W2uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSvBC8gORNRxmR/7rO7RkTSb0uIRhhLwYf/F5MVxx/A7rEWG2ukBhlAN8DEOp7UQYfCRvxOkhKGTa4Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbR0nIRFqT7ltOZ3fYJ+B6ZaJ73Bey9OgWEWnUaYvo+oCwSO9
	+WCt4Kr5zl98pQPmU9XjpeiOQLmuA9OcHThclWQSIf6yl3cYIvprKoILFw==
X-Google-Smtp-Source: AGHT+IFRZvU552BH5pGuzeGgfR9xh2OxF5DiqF5B2TBqJ0fArJW6IOKGm1J9OTqxL5jsoRVtqIGdcQ==
X-Received: by 2002:a05:6a20:72aa:b0:1db:f087:5b1d with SMTP id adf61e73a8af0-1ddb0338a66mr3866113637.37.1732115009383;
        Wed, 20 Nov 2024 07:03:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724bef8da6asm1786565b3a.123.2024.11.20.07.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:03:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 Nov 2024 07:03:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (isl28022) apply coding style to module
 init/exit
Message-ID: <47ce8ae6-fe80-467c-a177-1a8c3812956f@roeck-us.net>
References: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
 <20241120083349.22226-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120083349.22226-8-wsa+renesas@sang-engineering.com>

On Wed, Nov 20, 2024 at 09:33:52AM +0100, Wolfram Sang wrote:
> Function declarations can be in one line. module_init|exit macros should
> be tied to the function.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter

