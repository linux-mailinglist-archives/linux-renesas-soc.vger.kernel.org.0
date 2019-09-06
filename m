Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3461BAB5BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 12:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387968AbfIFKX7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 06:23:59 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34580 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729613AbfIFKX6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 06:23:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id z21so4592726lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Sep 2019 03:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f8H5bIBdKoS1HrUh2drI7VlolibnVhaDOfnjnsW1YW0=;
        b=vOks+y2m8igch8MnJvoqaEzNWPHFZVdoyWn47m6oGTq4rIXHPGpkJmSaXTh6HH9+I7
         2ckYdkglCXXw3MK+ZyJYVYgtcV4ZpCmVzBWz4HCFhXCmVsmbo7mrVTSiRzNthXFtlOp1
         sIYkBtKvrcK2gkkU/vfW3/0p6S4UItFXVsjXr2pG3OWiT1nuV7yi9+zku4LuwAt0TjBr
         vscUyc4jsaSXoLvDWBkED3O1hkSdurZkw36E+5HnrhZ2KttxSTTGABKeQdAlYPXGZ6Ot
         1M6JlLvCnPK57y0zdvdOmsw/bxHX0MbNAS7+HgzhPf7wptgIcJgzeezIzRIvIvNG1bRf
         XzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f8H5bIBdKoS1HrUh2drI7VlolibnVhaDOfnjnsW1YW0=;
        b=pjyo2urTkelzxjz43/fXz1DEc6wsoA5qDyB6wXCmY9XxpZeXSbo1WudwEQGGTj1uA9
         /lrglqPJ6k7eURXXbS+jvuf8N80Nrp4gpjuYL7ysG95cwqAFZzTBonbIZPKN7Gjo/6SR
         cfpN0dD7n7iBk3vzPse3jrQHDMIpaj5sTkg9DHbyI8DsdWLOO4slJYP2RYCJoqNyrYZ9
         jcZaSNF3FKtpbee70yIPTKzdBJn/3myn2SBM1d2KMlX9S2unYHRyoru3zQ7O45AFlIUa
         0CROO2AZeoyUr49AntqEO6Wbr5Szy209RLO661s8fUh7EQqvoNhY7T7TSbK8mk+ufRO7
         nLAA==
X-Gm-Message-State: APjAAAUOruOAsl/yj3Bf/6/9y/QoWnd/q+Ocba7gbFvIjFfNptKnKJDU
        HNn0Zgh++8wQt1jCpsm2tepxR0X4MSNwmA==
X-Google-Smtp-Source: APXvYqxOyKnZcINnzuSv7Y7eZ+8vhh7r6vOzEbyIgjQQLS8a7Ndo2BaJ+llUi4e0/FOkOhNLFKOxtA==
X-Received: by 2002:ac2:5101:: with SMTP id q1mr5681233lfb.13.1567765436772;
        Fri, 06 Sep 2019 03:23:56 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:467:6174:2510:8c9c:d80b:bedb? ([2a00:1fa0:467:6174:2510:8c9c:d80b:bedb])
        by smtp.gmail.com with ESMTPSA id t82sm1038256lff.58.2019.09.06.03.23.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 03:23:56 -0700 (PDT)
Subject: Re: [PATCH 2/2] rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190905214915.13919-1-niklas.soderlund+renesas@ragnatech.se>
 <20190905214915.13919-3-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <daa66ff1-1130-c8b6-5f42-bc9449a3642b@cogentembedded.com>
Date:   Fri, 6 Sep 2019 13:23:43 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905214915.13919-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06.09.2019 0:49, Niklas Söderlund wrote:

> The hardware do not support capturing the field types V4L2_FIELD_SEQ_TB

    s/do/does/. Just one typo. :-)

> and V4L2_FIELD_SEQ_BT. To capture in these formats the driver needs to
> adjust the offset of the capture buffer and capture twice to each vb2
> buffer.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
