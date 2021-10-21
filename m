Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0D9436487
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 16:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhJUOm5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 10:42:57 -0400
Received: from mail.iot.bzh ([51.75.236.24]:32182 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230471AbhJUOm5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 10:42:57 -0400
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 4457916FA2;
        Thu, 21 Oct 2021 16:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=YXtnGL2eS0aYDuGyXRdffmlLIa
        WSjZ380iZ1BOJeb+s=; b=Lw6p8TSH06yZ89PaN9Todb3Y9A15BgbiVc/dEF4QXB
        HcsF9Z6tBHt56niq5EdbTTc428/s1/81I1mr5HaC0xDXSXOgcUXBDDqzsVzLhyYF
        7KKjsCtAS8115kG2qaotOWFGYF+uEeR2bFi7hPqScQzT3r/7169NMyPB9gzo+odb
        2Mn0rZEAKfLjjOS0Xece1N3Co6U6Xx742tLKWDfPBJEFaLRtQHmxr0G1rLdP2crf
        +sAvttAf+WuoT7l0WQd0bLPDV4Jh2q5fY0l0swHeRVCsGp6XGM75ZTGle7OZDc+z
        lLUEvxeNshvfxjyKGqR10i5ApcqKxJleoO9764akk4rg==
Message-ID: <a972261a-7a28-95db-8906-3bee981221ba@iot.bzh>
Date:   Thu, 21 Oct 2021 16:40:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] soc: renesas: rcar-rst: Add support to set rproc boot
 address
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20211012121117.61864-1-julien.massot@iot.bzh>
 <CAMuHMdUyO+L40hP5+uzeyY+Tn-9un-ignekzzqx=5Nd6DkJSxg@mail.gmail.com>
 <2df286a3-c805-c160-d656-5ab88b7ea3ba@iot.bzh>
 <CAMuHMdXPpajirqtSwHkqphOqGgyf-FKe5O3oMvY44fxjsuCdOw@mail.gmail.com>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <CAMuHMdXPpajirqtSwHkqphOqGgyf-FKe5O3oMvY44fxjsuCdOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  
> Given rproc defines this as u64, I think using u64 would be even better
> than phys_addr_t.  I'd like to keep this as generic as possible, as
> someone may want to do the reverse too (boot the CA5x from the CR7).
> And of course there's also the SH-4A core on R-Car Gen2 ;-)
Ok let's go for u64, will just move the sanity check for 32bits length inside the
rcar-rst function.
Thanks for your time!
-- 
Julien Massot [IoT.bzh]

