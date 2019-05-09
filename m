Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B0A18ED6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 19:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfEIRT6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 13:19:58 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:42565 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfEIRT6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 13:19:58 -0400
Received: by mail-io1-f47.google.com with SMTP id g16so2220365iom.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 May 2019 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V+m5Mpr8zO2o3tnxbSyYTNbidDrHG3xw1+cXYMMZN90=;
        b=suJD/7sXko5TRixp+etDWiAHVZxSTs+fgb7fkU1BLudSZpZDp/h1k8FblPXH8MLwKd
         jA9Xr7mhA0uQiyQqD0zASebA0BBbQxY4HOaYA1EtVd0yQ4VaF0KQ2wIjcb/L6s2OXYtn
         iCMLEEOrFRCu3m6zJdVlERJQTtEOryV/7XOOQx0QbZ4O02+IPbUmYujQEVlYgos8JrKt
         4hf4E1oO+D+KIzVpjUsvVqPSFw1dTrQTuyYQMkjiA5STLlvk5WDNSTdl0UKbUft/9Z+0
         l1IuFiBjTSZu2bK+3dJxLrANL8RdjNwgj8LgFHdfAGnOwG+n6pN/epeQS6JYneCQk8JN
         mrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V+m5Mpr8zO2o3tnxbSyYTNbidDrHG3xw1+cXYMMZN90=;
        b=h+SWuiqNxVfUZBNVG+RKsbd8gEfLHvYCGtb41ENB/1/cr5ainzRbM381/rNf+inbAK
         83+6nXxfAAexZuVMA+FoYL9cUwmIANrfPCr3nDO3NU1+fCX6CLvybyKS9U8aYlF/Re63
         ibjO7cmsJu+pY80+yvhFnggtNZUw1o200jsaVEXB8dG1bXzR4VDXTay6bSP7LyP+7zOU
         pqeiZqD49g+O64zo98Kon/4ctgIaiNBuZxUfZ19w4sahHpdLN+ZUWZr6KpV2I1zZC6q4
         xIzbVLEbY9k2/7k8Rl+S3hwCvGQozCLPHdiHihEwJ0A8KGVKkd6FDNpERW+MmgeMbuZ9
         L9GQ==
X-Gm-Message-State: APjAAAV1u8AcSCzQKMwETx6d9BLnZVrxQ99gMAIrHRYtvCWcHiHA82f9
        L4Mw/FhvavkbGydxjwnnDPi5uLfCCH55YA==
X-Google-Smtp-Source: APXvYqwKqgG1yJvHz3aGTQ2MteUfRMur/T4jcL6RX8rWYs5VeeTXhnoep4OYRqROjInh+TFSMcyzOw==
X-Received: by 2002:a5d:9e09:: with SMTP id h9mr3575316ioh.250.1557422397281;
        Thu, 09 May 2019 10:19:57 -0700 (PDT)
Received: from [192.168.1.158] ([216.160.245.98])
        by smtp.gmail.com with ESMTPSA id 140sm1312670itv.44.2019.05.09.10.19.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 10:19:56 -0700 (PDT)
Subject: Re: [PATCH] sata_rcar: Remove ata_host_alloc() error printing
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190429152209.22851-1-geert+renesas@glider.be>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d7d697c8-60d6-5095-538c-f744832f50cf@kernel.dk>
Date:   Thu, 9 May 2019 11:19:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429152209.22851-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 4/29/19 9:22 AM, Geert Uytterhoeven wrote:
> ata_host_alloc() can only fail due to memory allocation failures.
> Hence there is no need to print a message, as the memory allocation core
> code already takes care of that.

Applied, thanks.

-- 
Jens Axboe

