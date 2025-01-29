Return-Path: <linux-renesas-soc+bounces-12702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B83A221A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0B06168159
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1542C6EB4C;
	Wed, 29 Jan 2025 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="it4uL4O4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7BE183CCA;
	Wed, 29 Jan 2025 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167708; cv=none; b=p0c56gtm3VFaPv2C67W8duamIsgk+tg34IWx+y8ieo5je1Ez+/PIYPYgkbbOOVAoNiZGqgUQk5QMLeOCYlWuvEeLkILPb+J3kTBcO7kUl0C8f57Zsxi6l2wSyg7CfEQh4GVk/xybugSQrEM5KbatGyA82D8iLrqjMdIuQRsw8JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167708; c=relaxed/simple;
	bh=51JFxIdLHO32kycwzuf4Dg11OCl6oy6l7w9N3oFUXDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqe4S1bHCWgYiiUTcpJKptERZrovIOZ5JQv0ECzihVyOm7CZnHVAYUwv4OYtIZfDKR7IOg0x09PpkuI20EzsABLfXZxs+yqSKYwMFhwZjt34Zi7lTapJWdWEBHQunDUi965h2er3TV6VC0j9P/Ki6JcjRjep8ZKR9menRNDZYDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=it4uL4O4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2164b662090so139999885ad.1;
        Wed, 29 Jan 2025 08:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167706; x=1738772506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZtRZcAZliCAEaerNJ2FN+llCSrEsddYbsoC6tLsxV8=;
        b=it4uL4O4mZJvDnjq4HEkBT+tdH4a8pH5eEQIZwPP7CeAgltPfMxHSMU/pvIPuYse+N
         xNJxMvV0N6gAyVnDMMxus+6sSwTKw+eysfSr7NeVa6Rd5V/sQV7/PhqUkJzJtNqLQXSO
         ejyRhm5hri6rZhZ6QP65dA1ST4MRv5wGuQ1L9Bm4feamoVaVxv4tJv9kML0yHH38DRWJ
         1RJm6wU7ON1nShvO/9aDiNiIduKLrQF3DA96wJkN4ju4Dz87PPj1G1rKJrQl+RooSUF4
         aJREAKdbxf5g3S26fuc/afyZbJHRTZsM0Q0Y3H2S5KSLRPA0XhJH1tYknnAMXOK+7j37
         tVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167706; x=1738772506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZtRZcAZliCAEaerNJ2FN+llCSrEsddYbsoC6tLsxV8=;
        b=hFb7jBY+BkddqcX/gu44GG7pwfeITypgUWPOaMC45Q+KQShbzlPZ/pZTVHrXF0jsT3
         9uI+D/HQwR86k03S3JXXZxvKwJ+br9+YGtdO/Xs4rZvSeU8eiNaatOvowZX281SY5rbl
         00Ym7g1scUhhtjpPJRQHMygh8Tj/q8J0rI4vOsAyYDrf3GvdKZTAkc3rA+pKZ7qb4mQX
         YMFBoDkL+5Q8Y5BSTKQ5t60hQ7Anu1W7FsXIWiIcJcXXenN66oaAXljLRbo4GrlHTJZI
         j+yMQTy1BjsNsem3rNv+lyBVU0+hnc5H0pfrennFdf9H/7tG+B3yxNjQ+9/2QQvxHxg3
         IJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg8LSuLQbAs9WRWEO95M7KXIcnqIsjNCArEakB1Xp0KLm3R5sLLDdQD2TccTZBfjyx8YcyKc1GFoPs1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYpR4gs9di3F4a2iuhlmdOD5Bk5EbgNJU3ruJGtfE7d+aq5jvb
	f5yc/QmzJQad/e5RVGapzjC3YbrmDE/XGA1J72/6tcC+MDvXCWj+6aRk9A==
X-Gm-Gg: ASbGncuvxegkgCgVElgNdqGQUrKOpw7Ezn/M0gWwcb+EswJPuJY/1UkVM+tuBFaWfQv
	FiY+B+uEsMmAOLDLE/gICoIKvOwmawCZ5k87cJpI7CXczUvzaFiiS7hpA2ZhYHVgZPEkfpDfcE9
	SXE7HW4XT+L2tJdnc85Hq18TH1BrRH2hTqImv2xARfjPYiPRTxYjwtmvPQ3zVs+O+lZ9PNFrU8w
	mhMLHWU9iwcoH/Dz4hepJvNyYEqXK6ose4prOj3bvRLnw6LjZL8s0m1bWstOiw+bMutgo1ynbEK
	pVsE5XXHbB6hvtp0GHvIBlY1oi+d
X-Google-Smtp-Source: AGHT+IGIjYwoDKYAFBHVGzfDmIEoCjdwNT9mCoPaeZrw+f2MiUMHP2Dnxmh36gcuNiZFUjhC2z0ivQ==
X-Received: by 2002:a17:902:e84c:b0:215:ac55:fd72 with SMTP id d9443c01a7336-21dd7dd86b9mr48768705ad.37.1738167705721;
        Wed, 29 Jan 2025 08:21:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414ed3bsm102051185ad.193.2025.01.29.08.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:21:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jan 2025 08:21:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
Message-ID: <50e84380-f054-4c2f-9961-6b8a1784ea10@roeck-us.net>
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>

On Thu, Jan 23, 2025 at 05:03:47PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

I expect that 'i2c: Fix core-managed per-client debugfs handling' will
be applied in the mainline kernel by the end of the commit window. If
not, I'll drop this patch and re-apply it after the problem in the
upstream kernel has been fixed.

Thanks,
Guenter

