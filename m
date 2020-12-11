Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A102D763C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 14:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436582AbgLKNHS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 08:07:18 -0500
Received: from mail.iot.bzh ([51.75.236.24]:34231 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390550AbgLKNHC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 08:07:02 -0500
Received: from [192.168.1.26] (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
        by mail.iot.bzh (Postfix) with ESMTPSA id 0828C40098;
        Fri, 11 Dec 2020 14:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1607691971; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n3ddXouhWmctkGQcbuO/A5OIKdMDYc7jTpItIV+aiTM=;
        b=D7rMQKR1Btwui2tYvopMfO2p9XZVSmf2zJCmCwgIPOgSBwsyiJSuHJ7YUdpglBzlnUbTyO
        QS90sJAYxt2wEQz/AdkOxbQltVkxZ+Qqzlld7YHLJPAzlePMs3+Xh+uziHeAxvxJXhqv/a
        wN5tnCgPmfHssiF46wfabYDNTQlQITlCC1vzDWtpQSTXpayMu1VeUX8kMkPJSYUV4mrUQX
        aQWh+etC9YbMnCVzPdNNrb3h/uRr8NcEZu01baubwxWgyXPNcfeYu4MyPcn10f23A/BKZv
        NftoOFY3KTEH/+F9MPOYI70oMhAJVSBLWJD84JO1r54rypMP6DCOrBcd3XKQ1w==
From:   Julien Massot <julien.massot@iot.bzh>
Subject: Re: [PATCH 0/5] clk: renesas: Add MFIS clock
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20201210142021.163182-1-julien.massot@iot.bzh>
 <TYBPR01MB53098A6476F176914F71239886CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <5526f9b5-59b2-492b-f541-8381894a005f@iot.bzh>
 <CAMuHMdVhVViA4zyiHNMdc_Y1NR7GXp=-wYtWvy1pTbFhFNkfZg@mail.gmail.com>
Message-ID: <85ac5ee3-c5c6-79f7-702d-68dc6499ac7f@iot.bzh>
Date:   Fri, 11 Dec 2020 14:06:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVhVViA4zyiHNMdc_Y1NR7GXp=-wYtWvy1pTbFhFNkfZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Is it OK if I postpone applying this (possibly squashed into a single commit)
> until you have posted an MFIS driver?
Yes it does make sense, the mailbox driver could take longer
to be reviewed. I was more looking at how to break dependencies if
the mailbox driver will go into a different tree.


Thanks for your time,
Have a nice weekend too !

Julien
