Return-Path: <linux-renesas-soc+bounces-11651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5351B9F94F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 15:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6506D1636CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 14:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856AA2185AB;
	Fri, 20 Dec 2024 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq32U/uG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77EF27462;
	Fri, 20 Dec 2024 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734706611; cv=none; b=NekGsUFiPRv+a/ME2xhvnUiustsowfyXQdibxVZ3kjIzMJeeNu+OlDLAFHqOA5rYSbz+x4fK3rc7vvuyMRYFu+1sipCluLGkkuPba5p1TO6SHpb2b4RGImW3H3/nFR8AAON1Aqb1K77CetCaWGEdvudseb0bsje3k0dZTJdPJxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734706611; c=relaxed/simple;
	bh=g2lXLlGmiswrkppAV4tgjHrCeNM3AvxFRPzJXssdxus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDf8ueXUQGsXvWaQVMevnuk8c+HdrLiO0VgwDo7Z5OlLSgJ4vFW1FXGBeKSxX9aXqjZFrweKXJqOkzzXafRXeBZmDhJq0l7Vpe31szffUIKRm4+UFY9/H0hpE30mjzYxck7fqxzd3a6nplEcll7OMtPsMLPw/dJKQxXv+4CqH2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq32U/uG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21631789fcdso21247485ad.1;
        Fri, 20 Dec 2024 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734706609; x=1735311409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UNs9tktAq4sOYPqae8KzOkAoknFSvGyrWn8N8Xvrzo=;
        b=Pq32U/uGwXtUlr+SUtfjmAtUCcx3xI3+n1dWqxveKT1EyjTTtp8pCftygIPlyDyxnc
         N2tB5co786KJDvMP1bROvJ9+bGtOKBlUrVCU8mbYXjJyP7pQOISFryFvXZbhZyYgBu6Z
         JqAMo10O67cQNPO8uhG/4ovMfvAA5sXHljNDOvSnDku3jGNQbC3V4Iyy3d74y6BJvk7E
         0fn1zr2tWcn5IU4cV0vZObfIBfVlSkLd23s4qWrN8ii4AiayG8hMfKcJe4KPWvLSa7CH
         5wKIU6jGX99lI8kcusvXIGi12dMCbE5Bm0AQH+ugalIFmszq/+qR9tpGCSYJC4HobIIu
         pBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706609; x=1735311409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UNs9tktAq4sOYPqae8KzOkAoknFSvGyrWn8N8Xvrzo=;
        b=NE/TQzMWDbVWsM69ayRW+yclBlib/uXEN8Y54Vs2d+1wQKi9YDE0THHftpItgYEd49
         d9q1JiGBf4QoOQpdYEAFDr4FGpzYZKlgCru2dJD/Omzv38aV0gEESLu6ho4lDdEnqST1
         kjb9g/4lswmt/Y/tGfQKc4jAvKQQIstJhc8xkjJB5bspBMYWLggsv+7GkNsiYAdu5bUi
         axRM+/XdwqUhv23UrCxrBnM1r/SDhPLasKYlqiinAJyfM7DOFe8diejMcVXV5zqYwF0k
         ZeMhiKlaZXEYlebSvXls2DnLsInPCglsxxKwUisZKSgoU9iZmAoSStU8FBUtgcpD/DqF
         ssZg==
X-Forwarded-Encrypted: i=1; AJvYcCWhX7V7GytFbHeNkG3/kbvxr5zWaffu4dUHJjFa1NNiqYz8t+E1YfJetPEUASRBIYfN9z7kfjInBvPu2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfWAQoK7gLlbwpI4+fdehv5zYeGiUXge9QoS+0KMqMOlq0eh/R
	bS4jM0KVAIEVgiYmI4jZyw7xYzvj4w5BoAoCSoBZ+rxuPszTwiQr
X-Gm-Gg: ASbGnctDJwHcx4IMfLWpW3U4QKjpAr0ru48DPCbfEos2IPC4FFkdBavnthB2R9HacfW
	t10Ju6rFEJUyhO0cNrS5OGk6BHe+6LLaJtYraJH0oQzA2id4T+yWXF6UMtLEuEAvC0XD4ShEtqt
	m9TMGI8gCSsXmEVb7IVjXgbqcnT6KrtF4izIHsc0so4KCYmPZdGRXYhh0pjyFhurD+IL9/tcI4I
	amLy8NcjaRVsH4NX0RWax5MmTakMmGejpfCy+baIngQfVVmpr1OKsSqVBhnxN8xFWeHoA==
X-Google-Smtp-Source: AGHT+IF3P5SoXh7psASElj50HFZ3vQxjtfbfVygHr7W3BI4DsKItvc3x/L1q+ybv/mb6wqAfY+j/nQ==
X-Received: by 2002:a17:902:da8f:b0:215:98e7:9b1 with SMTP id d9443c01a7336-219e6ca6e4amr42649375ad.5.1734706608880;
        Fri, 20 Dec 2024 06:56:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962bfasm30080115ad.2.2024.12.20.06.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:56:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Dec 2024 06:56:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH 1/5] hwmon: (lm75) simplify lm75_write_config()
Message-ID: <a2c4bb48-8ed8-4225-82dc-232cc0708958@roeck-us.net>
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
 <20241219225522.3490-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219225522.3490-8-wsa+renesas@sang-engineering.com>

On Thu, Dec 19, 2024 at 11:55:23PM +0100, Wolfram Sang wrote:
> After previous refactoring, it is now possible to make
> lm75_write_config() a simple inline function.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Gueter

