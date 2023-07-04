Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53BE747292
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jul 2023 15:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjGDNUP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jul 2023 09:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjGDNUL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jul 2023 09:20:11 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA3310F8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Jul 2023 06:19:54 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbc244d39dso73793695e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Jul 2023 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688476793; x=1691068793;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvCh8V/rBthoWkYpCH26tqBrzJhbH+Fg29AhlWEeeCs=;
        b=wCOweyhmg4pD8QTF8xhWJp7yhm3+rDqYvhpEWYrpTHmvbm/88sUMloED48lBCY82KO
         sJyUL4/oZXmRd96CIRy8bkZoWV2pstNgK6dtGE03fk/fa1vd71OES/Iht2RJPIcJE4JQ
         F6/DDjki1/le6HdZvHV9KORH3xAw+kgzyGjFAw/M0a/fcoA9Gl4XGSClZ2lEX497Vlue
         MfbOiiwSyKfE7e1TVjcpNcJ0+PI4RTa0D5j3Kj6WmlXL/wQxmOl/vwPnKNkXXoh+y8Zy
         pCSXyWkF8+Cn0TFqwb6H7dBS7TnQ1jyeqPPHxqA30Dn03lTRdTtjSjMB4Q+Ql7GVuvFN
         ZC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688476793; x=1691068793;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvCh8V/rBthoWkYpCH26tqBrzJhbH+Fg29AhlWEeeCs=;
        b=MN40Bh8PSHQuatcdZddTNgAjg8RET+akQ11evngrPvtLd+CtJhI6KP1EgqYEanw+oK
         EQ9SFHsi7/ADXiqg7+a2iSgAWdizEh88Yn6gdj3cOcvRrX8BPp+0YTk015OmSQaz9tJe
         cTAwdZFM3fptarFle2bdIMlkPL7cY5FW5QDnvLO7PdppRsfwqsbJ6dIXJa5DCyMMuijH
         O6DvnMAJIyLMU5GNrDh1FElHg6c+7g3mVQlfZ6wdpVk512Ydb66KUK3wLTSoLbGQ1uVn
         KgrZeyKbhL3MPNFuiIOfRZPCWEizP+FJfvEASIseUM1CPOaxaM+n7uyYBDnKVLc37aTJ
         +uWA==
X-Gm-Message-State: ABy/qLZlwdO7cReq1qoCsxeCS1h+dd2v2++KD077FjL+Hp2fz28cNDCF
        F1bg6GaLxt8tfPBck8eJ2yAPLGjXvI+/OgNP3Mw=
X-Google-Smtp-Source: APBJJlFOLi1JViyuQViCj9xygmOZbnGuzgqIAGAYhRgaiXblxn6Q8rQJnCmolFcKSgqpmsa9mlVOIg==
X-Received: by 2002:a05:600c:220c:b0:3fb:a100:2581 with SMTP id z12-20020a05600c220c00b003fba1002581mr8333362wml.14.1688476793162;
        Tue, 04 Jul 2023 06:19:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d13-20020adfe88d000000b0031438257aa9sm4966607wrm.36.2023.07.04.06.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 06:19:51 -0700 (PDT)
Date:   Tue, 4 Jul 2023 16:19:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     biju.das.jz@bp.renesas.com
Cc:     linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [bug report] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx support
Message-ID: <427f194e-d8b6-41de-a1f9-6bec4a9ef057@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Biju Das,

The patch 8749061be196: "tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx
support" from Apr 12, 2023, leads to the following Smatch static
checker warning:

	drivers/tty/serial/sh-sci.c:593 sci_start_tx()
	warn: sleeping in atomic context

drivers/tty/serial/sh-sci.c
    573 static void sci_start_tx(struct uart_port *port)
    574 {
    575         struct sci_port *s = to_sci_port(port);
    576         unsigned short ctrl;
    577 
    578 #ifdef CONFIG_SERIAL_SH_SCI_DMA
    579         if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
    580                 u16 new, scr = serial_port_in(port, SCSCR);
    581                 if (s->chan_tx)
    582                         new = scr | SCSCR_TDRQE;
    583                 else
    584                         new = scr & ~SCSCR_TDRQE;
    585                 if (new != scr)
    586                         serial_port_out(port, SCSCR, new);
    587         }
    588 
    589         if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit) &&
    590             dma_submit_error(s->cookie_tx)) {
    591                 if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
    592                         /* Switch irq from SCIF to DMA */
--> 593                         disable_irq(s->irqs[SCIx_TXI_IRQ]);

disable_irq() is a might_sleep() function so it can't be called while
holding a spinlock, but the sci_dma_tx_work_fn() function is holding a
spinlock when it calls sci_start_tx().

    594 
    595                 s->cookie_tx = 0;
    596                 schedule_work(&s->work_tx);
    597         }
    598 #endif


regards,
dan carpenter
