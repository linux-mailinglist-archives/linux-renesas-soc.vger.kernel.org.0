Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14A47A5DA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 23:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfIBVrE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 17:47:04 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36188 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727603AbfIBVrE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 17:47:04 -0400
Received: by mail-pl1-f196.google.com with SMTP id f19so6994883plr.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Sep 2019 14:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bE3CAGhnJZegvIyfQXiX7dFDWRKDXbLDv++b0LQi4ZA=;
        b=j/KvpmYKp5WcE2QOK0RAlwqt+IgtxvzMAxVB8SmfSj0/pOnQV6c2CsE3AhMxEGZ7LO
         QHoUNeRRlAwj6j2iwtZMqBLNwFsXOT9docsS2b86DNBZRE7vNX7MG+axOrC0MA0QnjMK
         luQSr0KbW9tQ2SEmb7nPpFCRhkC0RIOVXlh6YM9O9Sg5g4VbVYdjagxeLsMMSHm1rQ8e
         aMJlnnuzI09Dj53mES7Bzt4WXwZ7m8nyMMU4IWG3o+BPiGpZheP82fcUcJgEI2yw7ZfR
         eqQhoJTb5btqwS+2uAS9Etps6GRDO9Glz3AxMp0Z2mFP73H+Vhjy02G6cpdk6gJVBPny
         pEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bE3CAGhnJZegvIyfQXiX7dFDWRKDXbLDv++b0LQi4ZA=;
        b=WbfYEfB/RCvttk8FCJFAQuyydb9gGixSOv8hMTZu3N6uVKXIMkETxsMMlUbfV6RBdc
         Nj8wb9zh5xjMEjyGTfyjozlKl5g6EROJ+UVPAe/my3Q9mc9qD2MVoilYsxj4zjV/m30y
         xWIUmgMej7nSu7gBAPfInL+2g0yMKJxsJ17Kjo6WFNDQLvGPCAbDEUBsK6rJHmYlYLUh
         QZuEU/rs/AZl7iT62oFhgssFbulQ3c5KFyb4pi0RYOsKLruNZFjQzIin6yEI6V5YdMPZ
         zgHUAShcXTtOVXFW5dcMpjBwXYEitWolCkzazZINCxayAJ5f2/9a0SawDDZ4oz7aW8ZG
         iOTw==
X-Gm-Message-State: APjAAAWLQ3txxKPOume3oxBKonvC/Tt3XNmZPbLNIxxUfS+ECiwuJsqm
        eArGOfJkxKR0M+OiVPlqMzju50ND2psTfQ==
X-Google-Smtp-Source: APXvYqyJzfQKPBEQy19FPz3Lq5G4NPwWwbdV/9eJxkhq7nV/UN/iSGM54S9/O1hVayoRRjcFiYFOTA==
X-Received: by 2002:a17:902:b48c:: with SMTP id y12mr5329126plr.92.1567460823386;
        Mon, 02 Sep 2019 14:47:03 -0700 (PDT)
Received: from [192.168.1.188] (66.29.164.166.static.utbb.net. [66.29.164.166])
        by smtp.gmail.com with ESMTPSA id 71sm20770525pfw.157.2019.09.02.14.47.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 14:47:02 -0700 (PDT)
Subject: Re: [PATCH v10 3/4] block: add a helper function to merge the
 segments
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org
Cc:     wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <1566995743-5614-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566995743-5614-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <e549e8e7-9dfe-6f68-2148-f49a9089db37@kernel.dk>
Date:   Mon, 2 Sep 2019 15:47:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566995743-5614-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/28/19 6:35 AM, Yoshihiro Shimoda wrote:
> This patch adds a helper function whether a queue can merge
> the segments by the DMA MAP layer (e.g. via IOMMU).

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

