Return-Path: <linux-renesas-soc+bounces-12508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 022FBA1C514
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 20:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 456EA167E1B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 19:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C54B137932;
	Sat, 25 Jan 2025 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cl8LNSuw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54321CA4E;
	Sat, 25 Jan 2025 19:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737834967; cv=none; b=uNND0nnXB2sKIrx7EhzLqu5XW2aY7lmah3yhaJ3Tn9I6v7TvILfq74WFqeCF1HkUzxGDOEJD5Rts7W/FaQiM4v+85qClMIsTZBClL32Gk8T+MDxlk2SROMPvAupalQDVeqdLbKANOM13021nP2SeRN3oWRwfPD6a6uth61i52IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737834967; c=relaxed/simple;
	bh=LUCM8mJ05VdZH93V4LX/YNAtNtcu7poJKcTt/eyal9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvK8E2dli/mD0nO+KyrWLXDALKvO01hm1Posdbf/TkSyz3HlrFwzzr8I0CpsZ9u/KEWd1cToAlYC2Oj5LL/7WMxHBb1vXOebOqo0LvsDJivkIGfB2S1dwFn3Aecrj1UoWuGqBp7hziybiArZyxakfzEXL0jRkH9W7lH6jmcdFr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cl8LNSuw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166f1e589cso82114855ad.3;
        Sat, 25 Jan 2025 11:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737834964; x=1738439764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cpnMJSbj7I9ZYQxqNWfuhLaxf6uIlbs6JeFXGkjFb0=;
        b=Cl8LNSuwVIvHJs/roFkuES+oLj494dahV3mWJjfPWrb1uJvgrRGf9VLvDDSLtd4xtU
         OjvHgslYaES2Wf77e805N1BnetZl3qC14JCw7L9jEhG95zCgsZ5oh5x2BoBARC6d+g7N
         6sqs5ojKxi0PaY+1no2maF+O/5UuZyruZ8FCdEXo7HI1wYQA61z61Ka3kD9kHp5yUOAx
         ZBAJkpcEY3kEMsEb1qzS6MAuJzVmX6+yJ6QiNMnhm3Or/zZtfFuV6knRZtVQTA1bdq19
         O5E7cticl1eM7M7Yr3gJOwhunlgU3kYBwQvaBFtPd+iyuNiOfd1YShpqPb5+ETDp7o1o
         wTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737834964; x=1738439764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cpnMJSbj7I9ZYQxqNWfuhLaxf6uIlbs6JeFXGkjFb0=;
        b=rMXgAgOsdAohmXVcVr5eJ7q6yKtjopQMHRjzFHz12lxk6vVWAec03prUbhyyeSIU0D
         OPhs6HLuE3r5/TmWm1TCG3G9C+2oWV+Hz2SGlppyY1g3Mn631tN93q/TGuVv9t3Xh3zG
         PKXsqbRNuXOQoVINaFK4ohlZ617FKEWR20n9eiUI/hXkMaeLHTbgciBU56hjakUVBRJn
         +f3lkXe2CBZH131sHxRHYq3vhvHet3kO5ElcYDU8l1bwoIAkp2cXgRekurFITo48GaGx
         7/YS238zSkWAU3bVfkq08ZowebW4Pl6F+bmq2ZrzwI3C16Q+cwQ9lPdIMawmUG0Z/xoQ
         zKmw==
X-Forwarded-Encrypted: i=1; AJvYcCV74dyN6+FS1fnIXYXHXxK2xdEKOwNi0xTljrbtwXpLkeLbS1LWUkFYEhkAW5gCmRDfbODUuRDdxwDfGg==@vger.kernel.org, AJvYcCVhqUFzEjDEDw3wKaGWVqZyTZLGmBCWzqU4KQeeWNtrLqZQeY33G3pU10gnFJZkpmeAPh9SP2b2a64g5ZUn3HctAxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvdPJa/MnpI4iJsvPFRm8M+ymh8htsAq19IR+S/WcoKNOF6TkN
	SLHYPlaaJ778fPGM8WPTQPhJLo4ABzSEk8eQktjeitK8yEnWUKqR+NwTew==
X-Gm-Gg: ASbGncuVtatoVQ5nvbB2u6yCIg6QxiTdcympUi6SsPQIPjh/GVHDdlsvvdORDFj8VQo
	hvGdpd/LD9YOyqTBGNVnoJazVdc5+ycZKlL5URh3DLgT7Lf+1ItkAVXu6EWVhOUOVkheRKetbPQ
	gF8K88fkBHUnPcrpWFZhr3L6HkkXbKPaDnU/7mH8HztDl6PGEmxluZHzzwXIUXIyTDLa599oRjC
	ZYBtuKkRZY/EsSJc3B0Mvd9zaRJpD+UEsyIN7qE0978p9DlJuG8oXYfMI6jjJt142YP+JbmONyf
	617VbsDdgheOaXAsuQ==
X-Google-Smtp-Source: AGHT+IEqtzQSvbJpf7zuJME7T2JTyYIM2ZxScmdcbCZryrDrQ1Igmk0tDE/kSFi3yATLwzu6clpPYA==
X-Received: by 2002:a05:6a20:3d88:b0:1e1:aab8:386a with SMTP id adf61e73a8af0-1eb2148ebd2mr63834035637.18.1737834964433;
        Sat, 25 Jan 2025 11:56:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c816sm4195952b3a.149.2025.01.25.11.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 11:56:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 25 Jan 2025 11:56:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org
Cc: Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
Message-ID: <6da29214-9ea3-42af-9ec1-7ed5a2da7bfa@roeck-us.net>
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
 <3c265d34-9442-495c-a715-be2eab3b37d7@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c265d34-9442-495c-a715-be2eab3b37d7@roeck-us.net>

Hi again,

On Sat, Jan 25, 2025 at 09:42:29AM -0800, Guenter Roeck wrote:
> Hi Wolfram,
> 
> when playing with this, I noticed that the i2c debugfs directory and with it
> the files located within are only removed when i2c_unregister_device() is called.
> Unfortunately, that function is not [necessarily] called when a driver is unloaded
> (for example by executing "modprobe -r"), leaving the debugfs files in place.
> If the driver is then loaded again, the old debugfs files still exist, referencing
> the previous instance of the driver.
> 
> I don't know if this happens all the time, but it does happen if a driver
> which was instantiated using the new_device method is unloaded with modprobe -r.
> 
> Right now that means that the driver has to delete each individual debugfs file
> it created when exiting, but I think that defeats the purpose of the entire exercise
> since it would make drivers more complicated.
> 
> Do you have an idea how to handle this ?
> 

I don't know if my rationale is correct, but the attached patch fixes
the problem for me.

Guenter

---
From c6ac6a1d153cedcc2caf7052929b381be7bfb795 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Sat, 25 Jan 2025 11:15:25 -0800
Subject: [PATCH] i2c: Fix core-managed per-client debugfs handling

The debugfs directory should be created when a device
is probed, not when it is registered. It should be removed
when the device is removed, not when it is unregistered.

Fixes: d06905d68610 ("i2c: add core-managed per-client directory in debugfs")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/i2c/i2c-core-base.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 85de36013835..4bd05eb1b501 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -583,6 +583,9 @@ static int i2c_device_probe(struct device *dev)
 		goto err_detach_pm_domain;
 	}
 
+	client->debugfs = debugfs_create_dir(dev_name(&client->dev),
+					     client->adapter->debugfs);
+
 	if (driver->probe)
 		status = driver->probe(client);
 	else
@@ -602,6 +605,7 @@ static int i2c_device_probe(struct device *dev)
 	return 0;
 
 err_release_driver_resources:
+	debugfs_remove_recursive(client->debugfs);
 	devres_release_group(&client->dev, client->devres_group_id);
 err_detach_pm_domain:
 	dev_pm_domain_detach(&client->dev, do_power_on);
@@ -627,6 +631,8 @@ static void i2c_device_remove(struct device *dev)
 		driver->remove(client);
 	}
 
+	debugfs_remove_recursive(client->debugfs);
+
 	devres_release_group(&client->dev, client->devres_group_id);
 
 	dev_pm_domain_detach(&client->dev, true);
@@ -1015,8 +1021,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	if (status)
 		goto out_remove_swnode;
 
-	client->debugfs = debugfs_create_dir(dev_name(&client->dev), adap->debugfs);
-
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
@@ -1061,7 +1065,6 @@ void i2c_unregister_device(struct i2c_client *client)
 	if (ACPI_COMPANION(&client->dev))
 		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
 
-	debugfs_remove_recursive(client->debugfs);
 	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
 }
-- 
2.45.2


