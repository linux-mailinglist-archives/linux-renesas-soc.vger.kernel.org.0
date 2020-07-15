Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884852209E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 12:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgGOKWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 06:22:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49445 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726798AbgGOKW3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 06:22:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594808549; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ko3g57NhBIWKq4qu1jUjxFkit/z6wz9jriCusjnaDMU=;
 b=l26Njrlpn20WEoGzLM9zwcly2EbKtoJQPMo1iIeVdjmxY08dc5yIr7lRHxc6vnQ05zJGIpA9
 AoKdeK8RvN3i0d518Yrv9MFTK67RuBiCxKZXlW5Voz3H9B6vo18/6KBOXU15KbSD8r8fYUcP
 ftba+1Z+Nlj6zARaZ9pUq0bB14o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIyZjFhOCIsICJsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5f0ed8d2512812c070cbee86 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Jul 2020 10:22:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F36A3C433BA; Wed, 15 Jul 2020 10:22:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=2.0 tests=ALL_TRUSTED,MISSING_DATE,
        MISSING_MID,SPF_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BB90C433C9;
        Wed, 15 Jul 2020 10:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9BB90C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 05/17] drivers: net: Fix trivial spelling
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200609124610.3445662-6-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-6-kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Martin Habets <mhabets@solarflare.com>,
        Shannon Nelson <snelson@pensando.io>,
        Colin Ian King <colin.king@canonical.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Eric Dumazet <edumazet@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ard Biesheuvel <ardb@kernel.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Wenwen Wang <wenwen@cs.uga.edu>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS
        DRIVER),
        linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS))
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200715102209.F36A3C433BA@smtp.codeaurora.org>
Date:   Wed, 15 Jul 2020 10:22:09 +0000 (UTC)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Kieran Bingham <kieran.bingham+renesas@ideasonboard.com> wrote:

> The word 'descriptor' is misspelled throughout the tree.
> 
> Fix it up accordingly:
>     decriptors -> descriptors
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I recommend splitting wan and wireless changes to separate patches as I
cannot take changes to wan subsystem.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11595487/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

