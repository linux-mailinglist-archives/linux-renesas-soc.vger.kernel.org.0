Return-Path: <linux-renesas-soc+bounces-12756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5450A230C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 16:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53DBD1627D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 15:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC2C1E98FF;
	Thu, 30 Jan 2025 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNXASO5o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4206C13FEE;
	Thu, 30 Jan 2025 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738249417; cv=none; b=LcrBWad3afDenHBd1KJ7dTAze0bquXP4QjYAujeGcM0vz4Ip2PVJ+TNTneW8toaa3y4ZFrILaHcvScstWuoFnoZnR4lF/xR4WI6l6AxY4aOEsZ48k3z/RUu/XSuba0Sq38cpBMwEYVZeBXttDGQziqXioPp7nHSbpVk4LcpytNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738249417; c=relaxed/simple;
	bh=ULihmFEVTv4Aw/Hqd50GZAJppCejg3+VCUo2DrGZTXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rT4I6djwGuR9xzkgxpC/nHExkEiECivOSVBE5B8gedd23tpbf8h4YnseDs14xKs63UN/Pb7UeGsu0pinfaVrx/jmB2CmOY3EFWGpr6qHwNFLygOHWE2Xl6NkmjjrkMG1GhB0oj27auPbFCDPGAFmBHfqvHQsuowX6KTfbFtirfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNXASO5o; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso1203351a91.2;
        Thu, 30 Jan 2025 07:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738249415; x=1738854215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Il6Y90630TRMUa0GeWm39euWxogTxvYFqI3yTv4H6ws=;
        b=LNXASO5oowwMuoLm49ZHjHJZgbBg4xJInkmjSa1p6FbpGyFYtg8kKvT4IPdbdOFzTe
         yCobEBbkmipDxx5mS0xBWj+OVf2Jl3bLMNcqjnEg7U1bKTSG0P2ul0i+P5+SW5yGX7Qu
         4e1L9v9ZNqmPMnmdeqWmu4dH0FSFbK2jVNX5FXaUsEloQbZHYyqlU0JmQ95fwONomu7a
         eAOgPt/Xb4C0DzmsBkGhHGJ3YrFUb2fd7r3QpWoPz8UwbWLdF3WcaonRlkRTaBd6M/lO
         rVMNcfqKn77WtZc2mKo1PHWrRLGnCjkYpebeGHB1xtIPH/mp+5jEyc+gLovQxJazreOO
         m0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738249415; x=1738854215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Il6Y90630TRMUa0GeWm39euWxogTxvYFqI3yTv4H6ws=;
        b=Ae8XlEQ8xxnNMBGUv3R6i6aJhB0dU6+NK90+p2V+/Ig8ldhrDnBYOvcuKKFdJc0HSl
         RPXaycaxb/mGeRi0pMHiJQ1qp0DMk9EJmyTP9q/YvAhHsir/zUrks4+GvWfst9OiE1+q
         N5u2AdXtpQ0FjxkRtz5g249onxCuuMkfcG2KCLu29qh8tNmMMgwcRsY47xkLULQzHczJ
         QlY4BxPIPSAxI20zsD66+2oUZ/aJOEML91wfjYI1GFCoRScnkihGm0yVqwdCfYhxNNfN
         /Bg0dZyW+F9i87/K91DtHo9UlIgLS1Kd4oh42jBP/UW8TfxYu/j4SYqw2djNZfmMKO6i
         Q1bA==
X-Forwarded-Encrypted: i=1; AJvYcCW10s6+Jfoi2QP/P4lz778m18BNLTcXWSATsnXyfEmIJJIPnF3C0kWRtP3F8CillmcXAJberVYlWhPhpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfimZtIhaj98O6t+Lop3CyvNP4rnkhPe+sAX+v/huMDx4ksdOo
	FJhSjxKbuWqu54uE5lP04MMT176dAJ2YLPrg7uLnKE4ke5UwU56gmI7LHw==
X-Gm-Gg: ASbGncsISbPWo7nfBqCUrBk5qotFzj2F0HUINr5DqgephjeDrXIfyrKWgjmlKqOfqi0
	l7AMiOXuRcamr+rqPZjivRo8SZ4eHgxsYvWjaLw3fHYwWfF+zeCkTRoVhN+Hkk4hFXidD/rjeoT
	K/ehkW6jiLq9gvqCMpALQuawmMolFh506/X6jVAhBjV6LGu7csrTH5Rnqwa2H7emoOz1einCvmH
	uPKsX4HBukpd+7p17GvwSsrBOWjAL2+V2u53NP0aKrBKj4dkaBX11HSQAI9bbaA8HWe4+WMM0m9
	7xAjmqxx6/GlIvyA/PcZsBHoiLfx
X-Google-Smtp-Source: AGHT+IGczMZHq9IPW4SZqSZh6AjE5jisI8PmXt56vJ3sQ7HzvtQ2GJZclMh6MNtxXv8JH9QLG9dHHw==
X-Received: by 2002:a05:6a00:3a0f:b0:71e:e4f:3e58 with SMTP id d2e1a72fcca58-72fd0c623ccmr9737612b3a.17.1738249415496;
        Thu, 30 Jan 2025 07:03:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe64275dasm1540153b3a.72.2025.01.30.07.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:03:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Jan 2025 07:03:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFT 4/6] hwmon: (sg2042) Use per-client debugfs entry
Message-ID: <8b32406e-aea9-4ec3-94a1-b772d726fed5@roeck-us.net>
References: <20250125123941.36729-8-wsa+renesas@sang-engineering.com>
 <20250125123941.36729-12-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125123941.36729-12-wsa+renesas@sang-engineering.com>

On Sat, Jan 25, 2025 at 01:39:44PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

Thanks,
Guenter

