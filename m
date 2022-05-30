Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7335384AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 May 2022 17:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242111AbiE3PWL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 May 2022 11:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242966AbiE3PUy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 May 2022 11:20:54 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1EB1207E0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2022 07:22:55 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id f4so11466978iov.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2022 07:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XJqXgw0Qi4Ge6Q57wB4GlvotoYnhUuSq68y9152a6AE=;
        b=Uon8wdSqHAkD3+idsDwqsw5/RYE9GUuamAt3cXARqV3NAeDaGTFSLoXs/G0hoAHt+5
         codSJJxeeG8vzFjwPvQIVi8pQwh8BHkUEnJ12EbeOHHixGjwXNoKXbv093UEgoEUQfeX
         Wod0GKDhAdiR/Ye/ytirv8v0lLWuUvpQJix1wPyUwccxWGh+xUage9MXo7G5h4Fk521r
         DI2oe8/v8oseOn3Ob0K+CIOBqiMgej7MNHpUOxL774B1gIBhklt7oanUcWy5rMkcHIBO
         DPJxFGRqOeAdN5gDE89YSbgO4qUovR5BE7nFCFMjyJGWrnHFIj5hKg5UUE4gd+cXFCdp
         hO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=XJqXgw0Qi4Ge6Q57wB4GlvotoYnhUuSq68y9152a6AE=;
        b=JPTOAqw8WV/wbr78vIPYNoin5I02zsHqaM6Uor20GdtRazMx5S639yGUN8XkUJMV+1
         HPeE+3XBzPXcqj0EpjIHVF62Ir6uNt1IVduqPc0Vz3GV5p9Gzs+tL2xC2YCa+Lin4pZ0
         PHrkyIbxgmwBw3uwvUe1TwdZboAbuFRiVXqdyEe2jKrZmtXexDNgJJFKpgpjWeLA0Sip
         p4b/Bg54gEsMrx/kT6dorBYq02D5vt/fE6L9cyMBUMrDKyHPrakycCxrQxHJc+m+F01C
         lHmr47xraOUTEcbDph0Y0eTkBpgxklRSaJeWBN8vYlArggHE/o5BP6duKdTlKsj4L7gR
         /fAA==
X-Gm-Message-State: AOAM5309bZLTuJw9xYNYm68r9DwtpuIhG/Mtg35XaA/TqhmxiHQIDXme
        TOixR9X1Xckw8kbJK0J9qL05h0+ulS8UqXlf/hg=
X-Google-Smtp-Source: ABdhPJwtvJ+07dKTyr7TpOGjLPDpnwsexIyHiV/hfgzfTPNlT+ipRRN6pgsw9s1i3X6T+BTCXU16HSeeuxtReVm1TBY=
X-Received: by 2002:a05:6638:498e:b0:32e:be76:f908 with SMTP id
 cv14-20020a056638498e00b0032ebe76f908mr20858880jab.66.1653920570933; Mon, 30
 May 2022 07:22:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6622:f06:0:0:0:0 with HTTP; Mon, 30 May 2022 07:22:50
 -0700 (PDT)
Reply-To: barristerbenjamin221@gmail.com
From:   Attorney Amadou <koadaidrissa1@gmail.com>
Date:   Mon, 30 May 2022 07:22:50 -0700
Message-ID: <CAOh7+P_+cJJknP6BJXj8NWX7nn8nkbA=aoSG2t49pestA9PG0g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d44 listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [koadaidrissa1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [barristerbenjamin221[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [koadaidrissa1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gZGVhciBmcmllbmQuDQoNClBsZWFzZSBJIHdpbGwgbG92ZSB0byBkaXNjdXNzIHNvbWV0
aGluZyB2ZXJ5IGltcG9ydGFudCB3aXRoIHlvdSwgSQ0Kd2lsbCBhcHByZWNpYXRlIGl0IGlmIHlv
dSBncmFudCBtZSBhdWRpZW5jZS4NCg0KU2luY2VyZWx5Lg0KQmFycmlzdGVyIEFtYWRvdSBCZW5q
YW1pbiBFc3EuDQouLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCuimquaEm+OB
quOCi+WPi+S6uuOAgeOBk+OCk+OBq+OBoeOBr+OAgg0KDQrnp4Hjga/jgYLjgarjgZ/jgajpnZ7l
uLjjgavph43opoHjgarjgZPjgajjgavjgaTjgYTjgaboqbHjgZflkIjjgYbjga7jgYzlpKflpb3j
gY3jgafjgZnjgIHjgYLjgarjgZ/jgYznp4HjgavogbTooYbjgpLkuI7jgYjjgabjgY/jgozjgozj
gbDnp4Hjga/jgZ3jgozjgpLmhJ/orJ3jgZfjgb7jgZnjgIINCg0K5b+D44GL44KJ44CCDQrjg5Dj
g6rjgrnjgr/jg7zjgqLjg57jg4njgqXjg5njg7Pjgrjjg6Pjg5/jg7NFc3HjgIINCg==
