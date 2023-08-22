Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEDB9784E9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 04:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbjHWCRi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 22:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjHWCRd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 22:17:33 -0400
X-Greylist: delayed 908 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 19:17:31 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34267185
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Aug 2023 19:17:30 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-56-64e553c6a7f0
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id B4.42.10987.6C355E46; Wed, 23 Aug 2023 05:33:10 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=nOLICcIz7cI0cYA88UZ71+OPc0rY69OohRGNw9A4Q+5d8+SeiKG+iXz0pqNUQzQSp
          7TnXvyWCvXIPO4t6sJeP529A1YMMR4NDLfowa4hQDhNid92t6le+fj3P0j31QpLwX
          EwksdyhnPtJM2DsWamso+NOEIn9cZa8ksaJFv4v/I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=ab7xj25U9FhDrNeRkKEkQiQiDv/NVx2HmEHIgMaSgCuOTj10WAhny8BuSQOPHjHfT
          cwmbIQtiTY+TkCOj3vlY/7LKxJfbmFMW6yEXsmzXc2Z0DqgIB8bzwvzD0AB55G5zx
          xsTZeafzq5xQkvb3TV+XDlrD+AKGswZWJ7pYdhxoY=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:06 +0500
Message-ID: <B4.42.10987.6C355E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-renesas-soc@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:20 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW/dY8NMUg8N/RC22vnzH5MDo8XmT
        XABjFJdNSmpOZllqkb5dAlfGknUXWAp2M1e09S9iaWB8zNTFyMEhIWAiMe0iaxcjF4eQwB4m
        iaaLM5hBHBaB1cwS85+9YIFwHjJLTLz4jRmirJlR4k/HTbYuRk4OXgFriZ+/r7GD2MwCehI3
        pk6BigtKnJz5hAUiri2xbOFrZpB1zAJqEl+7SkDCwgJiEp+mLQNrFRFQlVizeT8jiM0moC+x
        4mszmM0CFF/+exHYSCEBKYmNV9azTWDkn4Vk2ywk22Yh2TYLYdsCRpZVjBLFlbmJwFBLNtFL
        zs8tTiwp1stLLdEryN7ECAzD0zWacjsYl15KPMQowMGoxMP7c92TFCHWxDKgrkOMEhzMSiK8
        0t8fpgjxpiRWVqUW5ccXleakFh9ilOZgURLntRV6liwkkJ5YkpqdmlqQWgSTZeLglGpg3M4U
        trbr4Ivc/C32idu77py98qLO+cfqzd7WHz9+uhwuILzL9K/Kh9mb8iZrzfn/x+en/RuL61fc
        b86bG7npqoGWUt6S67KzuJ4d2px2cs86TcaiyS+0fn+7Z79kMrvAcqmOBwe+cTMf0DWvL27f
        VyIp26Yu85DvQULVD57of5xKhZ1K9p/1LJVYijMSDbWYi4oTAYviECw/AgAA
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

