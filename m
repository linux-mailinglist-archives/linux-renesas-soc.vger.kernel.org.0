Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0198964096B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 16:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbiLBPbY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 10:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbiLBPbX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 10:31:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73E9A65B5
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 07:31:22 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6A686E0;
        Fri,  2 Dec 2022 16:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669995081;
        bh=rbZogSJpisEl2pjmsFXtiJsTo7ffbn7KcFqnIFDrs8s=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=F1fCQH1F+lWugj6K9Ueucicx8RhkU2XUhqhV/8SApg7AlJK5jc5hGPl+dmWjtCINj
         n9xpQOivAqNKhrcz/0Q4IEp8rlIbb4Kv+ocywP+HwyzBWxJKEQtkspP480RmUZ5nTm
         PHWkkHubifer1dv9wRXBIS4g4h6NULKJdiZunc3w=
Message-ID: <8f147834-095b-caae-fec1-66b1740ff1c2@ideasonboard.com>
Date:   Fri, 2 Dec 2022 17:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH kms++ 0/4] Support Y210
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/12/2022 15:16, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Hi,
> 
> These kms++ patches add support for Y210 format.
> 
> I didn't find a super clear description of the byte order for Y210
> anywhere.  If someone knows what it is supposed to be, I'd appreciate
> verifying the code =).

Actually, this:

https://learn.microsoft.com/en-us/windows/win32/medfound/10-bit-and-16-bit-yuv-video-formats#overview

indicates that the 10-bit values should be shifted by 6. So the drawing 
code in this series is probably not right.

  Tomi

