Return-Path: <linux-renesas-soc+bounces-5131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34D98BBDFB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2024 22:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55958B215A7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2024 20:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ADC84A32;
	Sat,  4 May 2024 20:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xrdf6BVX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3941C6C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 May 2024 20:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714853622; cv=none; b=s+O3RItGiM+R4JvqSCgmbZMpTW26KOsMd4HIqYFCVQHjBFDgPoY80YY/nEEkGtyOGgo+ZeRr8ZF4aEl/stXdHOoIYlgVSPsnz/p8WRyU09AaibE6KjaWZyGu2dKU+5VU0PeRNvhLozSlS14bNxkJHQM2TkvDOXWiEh0TEoDEREw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714853622; c=relaxed/simple;
	bh=LUDZ/VUIBbdsUHpqLxJicBX6dWvX8voEizKKL+5iruI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qaXprfX32YwTtcAVFkMz356c7a0yN/GOvyMeCNE4yuPA/xqkxEmfVgW2LVNBOwL507o0WbjJRXaQW73NU7Nunw7/JPk5zbU+zbaTmmtcZP50SpYK/QA+4ElyeRh1iN94Eek+rAldqVReh0mfJf1S4YRZIL1tri7Bdu2Shu08sPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xrdf6BVX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41bab13ca81so7544495e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 May 2024 13:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714853619; x=1715458419; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tnVqSFLnUjSHiScDDBoE8Tjfux2uPMYvpSxKtV4mCpw=;
        b=Xrdf6BVXl0rX8wj0u98I9Yn4CngcXsDGbaqv/WfClh2C7sU7G/HTTo8GG7edFNpzvu
         j9A5ct6Gbzjox0KA2ur5k6A85mktxPwBg/MrvxBpEAHS///btUF9OSajnxv5rfsJf+rJ
         mDnYT/VsnCnIwb7Gc1fW1Lfblcq0jluM3wcV6oBa7j+c554y806uqIf2T1W0wuhz1/LK
         XNo9HHh0t6l6MXUapfnLlhJKyDpuz2jTR/vQkAiKaeTK3eUys524+F/hdhXydWVl7ibt
         Ezdqh0TbJYV+Z5JXF53ljAQJEfGoIr/Nt92uoYgAdb9Xbn5ZBPRFq9aCTuVXTZ5A0of1
         CtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714853619; x=1715458419;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnVqSFLnUjSHiScDDBoE8Tjfux2uPMYvpSxKtV4mCpw=;
        b=iuPam54TxL/kJ5tlDhGDduM0uETXKfl3ijrCXu7nQM0o7E87/7kWGHYP1FTu6kdhfA
         6LCtG6ckTFVoZY9YqSe6FQ6yYpazoCnYz/bST9vU6a4NSBx3ThNsAeYgsDop7jsAkmJn
         IUTwqkCiUg2WpKzmLBl07zxa12ueoYzEwaWIM+9JZzSvhunobWCyfJpYy2oFelDNKeNS
         PFqGqPgZpiHi7SLhq93MCIxdYBPuSKHnlCcN5gm0XC34walDA55oLttdIHgxBvtBFAiY
         g/PSjEAe18fcwh1Sf0kwjJpjVe72VKmF4IydO0e9DCFEZ+DmPhnxEuNog8ZFMjsc6+tO
         fYvw==
X-Gm-Message-State: AOJu0YzqVCnI+mMU5GzOBEx2r8wvIqY+uqgYf58SEDpaZoFWsS90GO1Y
	Xd4ZGzwFE77Mrdt/jYPyfgGXvXzpFZd6t5Lh/ITp5Z5XdcnaLTFaHt0Vn8K8YRK8Uw74Q204Z8m
	5
X-Google-Smtp-Source: AGHT+IHdlnlKSKG6VVSvWZ1mfGci9qad6mMJVQGGGn5ssoCOO0WYu+6Egb4HGIWGh3f5h+WUIGe/uw==
X-Received: by 2002:a05:600c:4e8c:b0:41c:23f3:65fa with SMTP id f12-20020a05600c4e8c00b0041c23f365famr6036806wmq.28.1714853619062;
        Sat, 04 May 2024 13:13:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v15-20020a05600c444f00b0041be78ae1f0sm10375090wmn.2.2024.05.04.13.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 13:13:38 -0700 (PDT)
Date: Sat, 4 May 2024 23:13:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: laurent.pinchart+renesas@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [bug report] [media] v4l: vsp1: Add histogram support
Message-ID: <164d74ff-312c-468f-be64-afa7182cd2f4@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Laurent Pinchart,

Commit 99362e32332b ("[media] v4l: vsp1: Add histogram support") from
Sep 7, 2016 (linux-next), leads to the following Smatch static
checker warning:

	drivers/media/platform/renesas/vsp1/vsp1_histo.c:153 histo_stop_streaming()
	warn: mixing irqsave and irq

drivers/media/platform/renesas/vsp1/vsp1_histo.c
    139 static void histo_stop_streaming(struct vb2_queue *vq)
    140 {
    141         struct vsp1_histogram *histo = vb2_get_drv_priv(vq);
    142         struct vsp1_histogram_buffer *buffer;
    143         unsigned long flags;
    144 
    145         spin_lock_irqsave(&histo->irqlock, flags);

_irqsave() means that perhaps the caller already has IRQs disabled.

    146 
    147         /* Remove all buffers from the IRQ queue. */
    148         list_for_each_entry(buffer, &histo->irqqueue, queue)
    149                 vb2_buffer_done(&buffer->buf.vb2_buf, VB2_BUF_STATE_ERROR);
    150         INIT_LIST_HEAD(&histo->irqqueue);
    151 
    152         /* Wait for the buffer being read out (if any) to complete. */
--> 153         wait_event_lock_irq(histo->wait_queue, !histo->readout, histo->irqlock);
                               ^^^^
This briefly enables IRQs

    154 
    155         spin_unlock_irqrestore(&histo->irqlock, flags);
                           ^^^^^^^^^^^
This resets it back to what we want.

    156 }

regards,
dan carpenter

