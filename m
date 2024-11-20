Return-Path: <linux-renesas-soc+bounces-10639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7289D3F09
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 16:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2411B383EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 15:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033CB1C9B76;
	Wed, 20 Nov 2024 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABtokfVS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB8E1BDA83;
	Wed, 20 Nov 2024 15:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114938; cv=none; b=MnYcAO4/2baR38e7EFRTd7VHBLD0yJxRUYt/uGW76kZ6BvFKTt+sXvwPh2uWJHzbva23SpRlYOuedonzUh8dk0ljhjIEjjndNEnV5WnzymYoL1jMagRqls4FXgbgMsItb474Belg7C8xfkO6or44A4EVj2DeS3z+SwJa+oUB5OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114938; c=relaxed/simple;
	bh=e169Z8ry/GwrEMLXyVG67E5LLXjDI63cOPTbVzZR0LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWcANa/Pknkquwy9MGYUpdH+IxIGz8lwCsq1vbTtlti+zF9KBCEW7vu69KWb3US0oQh8RWmWKiiM05uVBcV90Dv1jlR6aaCtx8yV1Uy8k4St1i7tLQgwLgyn0IjCQNmBInN/Bcgb79H+4PrptxW842GMQe/iXMZMSMvQyGWx9dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABtokfVS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2120f9ec28eso7240985ad.1;
        Wed, 20 Nov 2024 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732114935; x=1732719735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIuf4De+b07P480C7gFEpK//F0NU2hICpmOwIZMHJng=;
        b=ABtokfVS1FsLlv6eMWO0pvNminX4aZSwgd9a8xoW7U57dxP3T6FvKMP9f1pb3wEBbM
         wf0OjEcgPrGZ2d1yZDlqYabhKsiZBxQSWfiSfqrWSRzKq/3PBb8UOFTIHJMSFASkFetF
         ivk/3rsH2Bon1upswHRaSGyJhsaYrrxWUzg2dxBPdpbhiM6I7Dz6IMoodrKMRAptqt9Q
         SmHUgwVwthNRUV0+SRuH4f9rgemhiz0N+rYqqLEaAswiqBLImQHArlJxBpjweomRovkC
         2suuBnCLT7IM+qc5tfRe/LT24Vysei06v8Ftjj2rQ/yzogugZWru/fG5Ey0BN193yh+D
         hsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114935; x=1732719735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIuf4De+b07P480C7gFEpK//F0NU2hICpmOwIZMHJng=;
        b=it5fuKBE/Jhw+VlsK2wvBMZxp59bEbZv8opLx5ua0G0hhYQ9oAkm87NmTYB4ftRBES
         25NQfnvCD0jpGZb6cV4u2qsZ43cBFEmqw8+nS9lNRfqQZJswCIJk5HcPrjTjzj3aPEke
         vQqFxXi390JV2BVfdlynXq37oVPQNY2Yy7Xh5Chbkg1LVWw72beXr2NGahi0n8Uwd+EV
         h+eVURBRrm65iRUH8EZ6JoGPY+U9/+b4+yw19U4vGz2jC+PsUFNQJBzTKyySqEaxRsTn
         3yUPBOWWLoeecfQ01xr2k5YUU20Btt28xxfgVIQfr61n5i/P8YroQj++OGpyGhFVgdA+
         rWqw==
X-Forwarded-Encrypted: i=1; AJvYcCUuJTqpkWmo3p2UgZyaMA6vAP5ZTkmZSHGm3fQ+xL9T6+rPlba3n4JytMDa4SBsoncs2lJYvXJkSM4=@vger.kernel.org, AJvYcCXFMG0WF8n+J7idY1WVKtA2KhgzehdSMmWarOYuMvjp/5/ho1e0klHJ9Nf/50nON3Whf65r8t3Gf4OH3VE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxelkwIcDpeZVKnDR7N5rqiG3Yoxg9ROfAnG2owiXmBWJFNcGE
	GEtGXZVQhWBwM7sehKHakz0kh9onPZz+J0bXJ1HE9ZVe1p8SggzrFjCwGw==
X-Google-Smtp-Source: AGHT+IERhs9+m6W3Zfin0JKrSsHnHHZHTuAp8qyAl4qIU//tNBR5dMZG86deJhdSgU9czAdEooAhsw==
X-Received: by 2002:a17:902:d4c5:b0:20f:c225:f2a5 with SMTP id d9443c01a7336-2124cfb307bmr110599445ad.10.1732114933790;
        Wed, 20 Nov 2024 07:02:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724bef8da9asm1755639b3a.128.2024.11.20.07.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:02:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 Nov 2024 07:02:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (isl28022) use proper path for DT bindings
Message-ID: <777b122d-b346-411d-8a2f-f3e095530cd7@roeck-us.net>
References: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
 <20241120083349.22226-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120083349.22226-6-wsa+renesas@sang-engineering.com>

On Wed, Nov 20, 2024 at 09:33:50AM +0100, Wolfram Sang wrote:
> Vendor is "Renesas" not "ISL".
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter

