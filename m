Return-Path: <linux-renesas-soc+bounces-12019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C28A07C03
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 16:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 913B8188378C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 15:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA0021C191;
	Thu,  9 Jan 2025 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIxB82DP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C49249E5;
	Thu,  9 Jan 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436648; cv=none; b=bUCRLajdUKNf+L51MOd1BzN3NMHPNi5YWDMpUvLd9pl/POakdZzWtjB/xIlhOMXM3jlI4TBtV0/XkgBrmC+QkgOmWjHQqjd45tBgxYulotjdjZMZ0a+N4lqXLkDkVDwxiPXUySzXNilsAw1Q7Ya5VchkWOeTRTlmI4A9IyHGNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436648; c=relaxed/simple;
	bh=d93zm+uZ8uB8nlYkuwox2uBGep83ZnnW8gM2JtmbYMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilgEbEXEv2XIrISPvSSYjKRf0GxctVHWR3azCuFVJt0oAdFPaP97Cio9ifYKFcAG4YhEk6s7XQEHddmO9lcK0lbh0UUJCSGZMv6qvtG8QH5Jsa338QPZithyvrmZOC0VP8gxT6t34ySkMEhMPwZG5zMtNf/PdudfeVu2/bIoCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIxB82DP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso1582524a91.1;
        Thu, 09 Jan 2025 07:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736436646; x=1737041446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFBCcAEAPnuiBydTRMRNsfW9I4QP+EaJ0ZWxsgd7ST4=;
        b=eIxB82DPm278HfYgWq6seZXIeysDK6RRebDOLTZ7/CN3RFcf1/0x5x61ostHgh0HwE
         pP86/BKB3360C96w5elh1y4KXpATJahCBPbgoRFjkwwlzf2WNmn3bCq4oXKX3OXwXfC/
         WHpVb3A+WjCJg9QsMVb6En5BbtGdBWlrq3KT63cAy4z/AU335agRgvkAkzgXeY4uYiUT
         SvC8ypOXShclnuqRCZxE6izWxCmMZrDPyNcRyXaB7MIcFbAQhyWt3ALrrw7AYl3VVwMI
         JmCPxAlsZD5Nln2QfVWjTafsbuJJocO29KFf4dOCAF4asH7dPCSBW240mwki8eGjoMDq
         oKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436646; x=1737041446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFBCcAEAPnuiBydTRMRNsfW9I4QP+EaJ0ZWxsgd7ST4=;
        b=u5Zmg/3Oe+Y8IcbzeUtto3CBzUlAzmv7Ru5+WaV8vRUk3NFgpZbil2t0sbz25dy+21
         5Zxyf1dabrwxZe5jing1bp1wPrbktKCynUTV55tnx3lwjPK3VLI2xPokvGrv0I+umuFo
         jd8tjuz4BTjiYMaUjBkSvoQARLIRbgjiC63Xm5ksrIoxnyqWBt7vc82puCYEteykOsSV
         pXVb4N4YrhH0YYMxfL6v9qTf+nsZdGqVZpzPFPt0xQSf3ArmwDSlAs+m5soS7dYiD2z1
         ftd542rNf68MFt1g+TLtZn5gGJYIRlNTcD7WtXIiqamO95sObV2qgwnN5M64DaSJOy0W
         l6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1AKsW+CXiLiw6KVXWTGzVLaH8dpMrnWCMFVAx5G6UyCBXoxS7CruZdulBDj7bpg4FvFRjeF9a2so5Kw==@vger.kernel.org, AJvYcCW25yv3ISLagtG9UgHmpM3+GbRVbphTBdLDFuKp5yBgNxvZoj7OsKkxGsOxeXgrw4sk8r4AOdwhExWHypHB@vger.kernel.org
X-Gm-Message-State: AOJu0YydtllKXP+lbRnkH8qIutDJ2+XoEOZxFHFfWkLv7NNFCi9e0I/N
	6XFszpu7sCqFFsfuwYTf2vigsIWdDXJKq6mym+voftxOQMCHOaFBLLUNLg==
X-Gm-Gg: ASbGncvgE3j24SwicK01l9XtZq8Hmc4uUzn5jWPwlGL/JexcNXjY2k2XedwXg+I+zPJ
	KC0cmabyHaXogmor103hHm2Ha7mIr1K6cRXtRtQC6Z6Pj/tNZot2ftMPkt3aC6GJxXiEMkEmeWc
	L3KACGzVhJmoNJpguzK9VJMic5/yPOnTxhX4mBKBa62/nds3DjYYlKkAvFoV0yWm4Dkr8CVpTJe
	BnQ7HjiGSo5+JWWjHIvkyCERJtAWkhTP0WUJc6hNXz+i98rqgRe6DomrDKeZVxUE3zr8g==
X-Google-Smtp-Source: AGHT+IEsIIn5cA8LgfbL+CgYOhVHfmgA+RMMrkTVywhdf9RU9NhPrhKFCmBeM+N0HhQDRHuJ3L9caw==
X-Received: by 2002:a17:90b:538b:b0:2ee:f19b:86e5 with SMTP id 98e67ed59e1d1-2f548eae0eamr11232722a91.14.1736436646214;
        Thu, 09 Jan 2025 07:30:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9de3088esm92805ad.173.2025.01.09.07.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:30:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jan 2025 07:30:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (isl28022) Use per-client debugfs entry
Message-ID: <39481465-88f5-4cb7-b12e-695e2bf07010@roeck-us.net>
References: <20250109122112.45810-1-wsa+renesas@sang-engineering.com>
 <20250109122112.45810-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109122112.45810-3-wsa+renesas@sang-engineering.com>

On Thu, Jan 09, 2025 at 01:21:11PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

