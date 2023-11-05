Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6AF7E1702
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Nov 2023 22:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjKEV70 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Nov 2023 16:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjKEV7Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Nov 2023 16:59:25 -0500
X-Greylist: delayed 5166 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 13:59:22 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5CEBF;
        Sun,  5 Nov 2023 13:59:22 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id 20A1A18FD8;
        Mon,  6 Nov 2023 01:57:37 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id 19D62190E0;
        Mon,  6 Nov 2023 01:57:37 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id A996E1B8252B;
        Mon,  6 Nov 2023 01:57:38 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ZEMTke11s4B7; Mon,  6 Nov 2023 01:57:38 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 78F4B1B8250F;
        Mon,  6 Nov 2023 01:57:38 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 78F4B1B8250F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210658;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=k+0sOHHoCbkD3xLpLSaG6npPa6V54Jo7exFY8UuTF3w0qT8GDNFt2zEoGQKss895u
         L1yvQWQ+mlRedyyhN1ZzttuVk7TkZUinE2tKukc/wMpYM44izedDbSuDsLlYEc8tQh
         SHhBLIqwRYjjF9nHLYrTeVydY7rHci3XEylkFXA80bYyh6U+pO2Ny8PhahStCXE4Bh
         s6SDRefgSzsRwyZL7qCaGaW09sAsYfxA8QwTja5f8HmTAmyefRLHDyaqi3wVpSv261
         nramjk0qLfYy0jC0PqbnPcf8Efe4c1qE1nFBj5TxrxD968h3uNJvYvYnYnzwNp2D1K
         u7J+5OKuGT9Cw==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id SM_x_84p-TXs; Mon,  6 Nov 2023 01:57:38 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id 2547F1B8252B;
        Mon,  6 Nov 2023 01:57:31 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:57:21 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185732.2547F1B8252B@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

